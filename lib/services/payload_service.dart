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

  /// Save all [PayloadWorker]s and their file path as unique key.
  final workerPool = <String, PayloadWorker>{}.obs;

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
    workerPool.forEach((filePath, worker) async {
      if (worker.finished) {
        return;
      }
      worker
        ..remoteHost = remoteHost
        ..remotePort = remotePort;
      print('AAAA UPDAET HOST=$remoteHost PORT =$remotePort');
      if (!await worker.sendFile()) {
        worker.succeed = false;
        Get.rawSnackbar(
          title: 'Failed to send file'.tr,
          message: '${'Failed to send'.tr}: $filePath',
        );
      } else {
        worker.succeed = true;
      }
      worker.finished = true;
      print('AAAA PayloadService send file finish: $filePath');
    });
    return true;
  }

  /// Add [PayloadWorker] to [workerPool] for file in path [filePath].
  void addWorker(String filePath) {
    if (workerPool.containsKey(filePath)) {
      return;
    }
    final worker = PayloadWorker(
      filePath: filePath,
    );
    workerPool[filePath] = worker;
  }
}
