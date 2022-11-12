import 'package:grpc/grpc.dart';

import '../../api/protos/generated/messenger.pbgrpc.dart';

/// Worker to run send tasks.
///
/// Send messages and files to remote machine.
class PayloadSendWorker extends MessengerServiceBase {
  /// Constructor, should call grpc channel.
  PayloadSendWorker({
    required this.filePath,
    required this.remoteHost,
    required this.remotePort,
  });

  /// Remote host to send.
  ///
  /// IP: xxx.xxx.xxx.xxx
  final String remoteHost;

  /// Remote host port to send.
  ///
  /// Should in [0,65535].
  final int remotePort;

  /// Local file path of the file to send.
  final String filePath;

  @override
  Future<SendFileReply> sendFile(
    ServiceCall call,
    Stream<SendFileRequest> request,
  ) async {
    // TODO: implement sendFile
    throw UnimplementedError();
  }
}
