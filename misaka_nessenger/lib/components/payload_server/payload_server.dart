import 'dart:io';

import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../api/protos/generated/messenger.pbgrpc.dart';
import '../../utils/util.dart' as util;
import 'payload_serve_connection/payload_serve_connection.dart';

export './payload_serve_connection/payload_serve_connection.dart';

/// Server to receive files and messages from remote machine.
///
/// An instance should start when app started till app exit.
class PayloadServer extends MessengerServiceBase {
  /// Constructor.
  PayloadServer();

  /// Record finished file content part count.
  int fileContentCount = 0;

  /// Record finished file content part size count.
  int fileContentSizeCount = 0;

  /// Save all GRPC connections.
  ///
  /// These connections came from outside.
  /// All connections represents "receive" payload work.
  final connectionPool = <String, PayloadServeConnection>{}.obs;

  /// Implementation of [sendFile] function in GRPC generated files.
  ///
  /// When remote machine (as a client) tries to call [sendFile] method in
  /// proto file, this function will be called.
  ///
  /// The return value is a reply to remote machine (client).
  @override
  Future<SendFileReply> sendFile(
    ServiceCall call,
    Stream<SendFileRequest> request,
  ) async {
    var fileName = '';
    var fileSize = 0;
    var checkExist = true;
    final peer = call.clientMetadata!['ClientID'] ?? 'UNKNOWN';
    final downloadDir = GetPlatform.isAndroid
        ? Directory('/storage/emulated/0/Download/MisakaNessenger')
        : await path_provider.getDownloadsDirectory();
    if (downloadDir == null) {
      print('AAAA FAILED TO GET DOWNLOAD PATH');
      return SendFileReply(finishedFileSize: 0);
    }
    if (!downloadDir.existsSync()) {
      try {
        await downloadDir.create();
      } catch (e) {
        print('AAAA FAILED TO CREATE download dir');
        return SendFileReply(finishedFileSize: -2);
      }
    }

    late String filePath;
    late File tmpFile;
    await for (final req in request) {
      fileContentCount++;
      fileContentSizeCount += req.fileContent.length;
      fileName = req.fileName;
      fileSize = req.fileSize;
      filePath = '${downloadDir.path}${Platform.pathSeparator}${req.fileName}';
      tmpFile = File('$filePath.tmp');
      if (checkExist) {
        /// For existing files, these tasks may be restart, so we update task
        /// information and reset finishedSize to zero.
        if (connectionPool.containsKey(filePath)) {
          connectionPool[filePath]!
            ..filePath = filePath
            ..fileName = fileName
            ..fileSize = fileSize
            ..finishedSize = 0;
        } else {
          connectionPool[filePath] = PayloadServeConnection(
            filePath: filePath,
            fileName: fileName,
            fileSize: fileSize,
          );
        }

        if (tmpFile.existsSync()) {
          await tmpFile.delete();
        }
      }
      await tmpFile.writeAsBytes(
        req.fileContent,
        mode: FileMode.writeOnlyAppend,
        flush: true,
      );
      connectionPool[filePath]!.addFinishSize(req.fileContent.length);
      checkExist = false;
    }
    final file = File(filePath);
    if (file.existsSync()) {
      await file.delete();
    }
    await tmpFile.rename(filePath);
    connectionPool[filePath]!.finished = true;
    connectionPool[filePath]!.succeed = true;
    connectionPool[filePath]!.forceCompleteFinishedSize();
    print(
        'AAAA PayloadServer finish receive file $fileName, size = ${fileSize}, sizeCount=${util.readableSize(fileContentSizeCount)}');
    return SendFileReply(finishedFileSize: fileContentSizeCount);
  }
}
