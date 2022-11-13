import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../api/protos/generated/messenger.pbgrpc.dart';
import '../../utils/util.dart' as util;

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
    var checkExist = false;
    final peer = call.clientMetadata!['ClientID'] ?? 'UNKNOWN';
    final downloadDir = await path_provider.getDownloadsDirectory();
    if (downloadDir == null) {
      print('AAAA FAILED TO GET DOWNLOAD PATH');
      return SendFileReply(finishedFileSize: 0);
    }
    await for (final req in request) {
      fileContentCount++;
      fileContentSizeCount += req.fileContent.length;
      print(
          'AAAA PayloadServer receive name=${req.fileName}, source=${req.fileSource} content=${req.fileContent.length}');
      fileName = req.fileName;
      final file = File('${downloadDir.path}/${req.fileName}');
      if (!checkExist && file.existsSync()) {
        await file.delete();
      }
      await file.writeAsBytes(
        req.fileContent,
        mode: FileMode.writeOnlyAppend,
        flush: true,
      );
      checkExist = true;
      print('AAAA write file to ${file.path}');
    }
    print(
        'AAAA PayloadServer finish receive file $fileName, size=${util.readableSize(fileContentSizeCount)}');
    return SendFileReply(finishedFileSize: fileContentSizeCount);
  }
}
