import 'package:get/get.dart';

/// Service that controls and handles transport tasks.
///
/// Control payload worker to run tasks (send/receive).
class PayloadService extends GetxService {
  /// All payload to run, store their paths.
  ///
  /// Local path: /usr/share/xxx
  final stagedPayloadPathList = <String>[].obs;

  /// Init before app start.
  Future<PayloadService> init() async => this;
}
