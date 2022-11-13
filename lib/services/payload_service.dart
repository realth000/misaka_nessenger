import 'package:get/get.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../components/payload_server/payload_server.dart';
import '../components/payload_worker/payload_worker.dart';
import 'config_service.dart';

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
    var serverPort = Get.find<ConfigService>().getInt('LocalServerPort');
    if (serverPort == null) {
      // Default port: 10032.
      serverPort = 10032;
      await Get.find<ConfigService>().saveInt('LocalServerPort', 10032);
    }
    _server = grpc.Server([PayloadServer()]);
    await _server.serve(port: serverPort);
    print('AAAA PayloadService: start listening at port $serverPort');
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
        Get.snackbar('Failed to send file'.tr, '${'Failed to send'.tr}: $f');
      }
      print('AAAA PayloadService send file finish: $f');
    }
    return true;
  }
}
