import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../desktop/scaffold/desktop_scaffold.dart';
import '../../mobile/scaffold/mobile_scaffold.dart';
import '../../services/scaffold_services.dart';

/// Build app scaffold.
///
/// Different with platforms.
/// Use this to fit different platforms.
class MisakaScaffold extends StatelessWidget {
  /// Constructor.
  MisakaScaffold({super.key});

  final _service = Get.find<ScaffoldService>();

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isMobile) {
      return Obx(() => MobileScaffold(index: _service.currentIndex.value));
    } else {
      return Obx(() => DesktopScaffold(index: _service.currentIndex.value));
    }
  }
}
