import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../transport_page_controller.dart';

/// Navigation bar in transport page.
class TransportNavigationBar extends StatelessWidget {
  /// Constructor.
  TransportNavigationBar({super.key});

  /// Controller
  final controller = Get.find<TransportPageController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => NavigationRail(
          backgroundColor: Get.theme.colorScheme.surface.withOpacity(0.3),
          minExtendedWidth: 150,
          labelType: NavigationRailLabelType.none,
          extended: true,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const Icon(Icons.send),
              label: Text('Send'.tr),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.all_inclusive),
              label: Text('All'.tr),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.download),
              label: Text('Upload'.tr),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.upload),
              label: Text('Download'.tr),
            ),
          ],
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (index) {
            controller.currentIndex.value = index;
          },
        ),
      );
}
