import 'dart:io';

import 'package:get/get.dart';

import 'config_service.dart';

/// Service that controls and handles transport tasks.
///
/// Control payload worker to run tasks (send/receive).
class PayloadService extends GetxService {
  /// All payload to run, store their paths.
  ///
  /// Local path: /usr/share/xxx
  final stagedPayloadPathList = <String>[].obs;

  /// Server executable file path on Windows platform.
  static final String serverExePathWindows =
      '${Directory.current.path}\\MisakaNessengerServer.exe';

  /// Server executable file path on Linux platform.
  static final String serverExePathLinux =
      '${Directory.current.path}/MisakaNessengerServer';

  @override
  void onClose() {}

  String _getServerExePath() {
    if (GetPlatform.isWindows) {
      return serverExePathWindows;
    } else if (GetPlatform.isLinux) {
      return serverExePathLinux;
    } else {
      return '';
    }
  }

  /// Init before app start.
  Future<PayloadService> init() async {
    var serverPort = Get.find<ConfigService>().getInt('LocalServerPort');
    if (serverPort == null) {
      // Default port: 10032.
      serverPort = 10032;
      await Get.find<ConfigService>().saveInt('LocalServerPort', 10032);
    }

    print('RUNNING IN: ${Directory.current.path}');
    Process.run(_getServerExePath(), <String>[]);
    // await _server.serve(port: serverPort);
    print('AAAA PayloadService: start listening at port $serverPort');
    return this;
  }

  /// Start send all files in [stagedPayloadPathList].
  Future<bool> startSendFile({
    required String remoteHost,
    required int remotePort,
  }) async {
    return true;
  }

  /// Add [PayloadWorker] to [workerPool] for file in path [filePath].
  void addWorker(String filePath) {}
}
