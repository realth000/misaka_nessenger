import 'package:grpc/grpc.dart';

import '../../api/protos/generated/messenger.pbgrpc.dart';

/// Worker to receive files and messages from remote machine.
class PayloadServer extends MessengerServiceBase {
  /// Constructor, should call grpc channel.
  PayloadServer();

  /// Record finished file content part count.
  int fileContentCount = 0;

  /// Record finished file content part size count.
  int fileContentSizeCount = 0;

  @override
  Future<SendFileReply> sendFile(
    ServiceCall call,
    Stream<SendFileRequest> request,
  ) async {
    final peer = call.clientMetadata!['ClientID'] ?? 'UNKNOWN';
    print(
        'AAAA PayloadSendWorker sendFile from peer $peer, request: ${request.toString()}');
    await for (final req in request) {
      fileContentCount++;
      final name = req.fileName;
      final source = req.fileSource;
      final content = req.fileContent;
      fileContentSizeCount += content.length;
      print(
          'AAAA PayloadSendWorker sendFile name=$name, source=$source content=${content.length}');
    }
    return SendFileReply(finishedFileSize: fileContentSizeCount);
  }
}
