import '../../api/protos/generated/messenger.pbgrpc.dart';

/// Worker to receive files and messages from remote machine.
class PayloadRecvWorker extends MessengerClient {
  /// Constructor, should call grpc channel.
  PayloadRecvWorker(
    super.channel, {
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
}
