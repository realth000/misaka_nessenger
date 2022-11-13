import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/scaffold_services.dart';
import 'navigation_bar_controller.dart';

/// Navigation bar.
///
/// Different forms on different platforms:
/// * On mobile, it's [BottomNavigationBar].
/// * On Desktop, it's [NavigationRail].
class NavigationBarComponent extends StatelessWidget {
  /// Constructor.
  NavigationBarComponent({required this.isMobile, super.key});

  /// Control if is mobile mode.
  final bool isMobile;

  /// Controller.
  final controller = Get.put(MisakaNavigationBarController());

  Widget _buildMobileNavigationBar() => Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          items: controller.barItems
              .map(
                (e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.label,
                ),
              )
              .toList(),
          onTap: (index) async {
            controller.currentIndex.value = index;
            Get.find<ScaffoldService>().currentIndex.value = index;
          },
        ),
      );

  Widget _buildDesktopNavigationBar() => Obx(
        () => NavigationRail(
          destinations: controller.barItems
              .map(
                (e) => NavigationRailDestination(
                  icon: e.icon,
                  label: Text(
                    e.label,
                  ),
                ),
              )
              .toList(),
          selectedIndex: controller.currentIndex.value,
          labelType: NavigationRailLabelType.selected,
          onDestinationSelected: (index) async {
            controller.currentIndex.value = index;
            Get.find<ScaffoldService>().currentIndex.value = index;
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return _buildMobileNavigationBar();
    } else {
      return _buildDesktopNavigationBar();
    }
  }
}
