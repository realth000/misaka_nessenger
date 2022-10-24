import 'package:get/get.dart';

/// Service recording and control scaffold state.
class ScaffoldService extends GetxService {
  /// Scaffold current body index.
  final currentIndex = 0.obs;

  /// Init before app start.
  Future<ScaffoldService> init() async => this;
}
