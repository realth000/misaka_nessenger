import 'package:get/get.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../components/payload_server/payload_server.dart';
import '../components/payload_worker/payload_worker.dart';

/// Service that controls and handles transport tasks.
///
/// Control payload worker to run tasks (send/receive).
class PayloadService extends GetxService {
  /// All payload to run, store their paths.
  ///
  /// Local path: /usr/share/xxx
  final stagedPayloadPathList = <String>[].obs;

  late final grpc.Server _server;

  @override
  void onClose() {
    _server.shutdown();
  }

  /// Init before app start.
  Future<PayloadService> init() async {
    _server = grpc.Server([PayloadServer()]);
    await _server.serve(port: 10032);
    print('AAAA PayloadService: start listening at port 10032');
    return this;
  }

  /// Start send all files in [stagedPayloadPathList].
  Future<bool> startSendFile({
    required String remoteHost,
    required int remotePort,
  }) async {
    for (final f in stagedPayloadPathList) {
      final worker = PayloadWorker(
        filePath: f,
        remoteHost: remoteHost,
        remotePort: remotePort,
      );
      if (!await worker.sendFile()) {
        print('AAAA FAILED TO SEND FILE $f');
      }
      print('AAAA PayloadService send file finish: $f');
    }
    return true;
  }
}
