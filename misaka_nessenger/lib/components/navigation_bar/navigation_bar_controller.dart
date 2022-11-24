import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Bar items in navigation bar.
class MisakaBarItemWidget {
  /// Constructor of bar item, just like [BottomNavigationBarItem] or
  /// [NavigationRailDestination].
  MisakaBarItemWidget({required this.icon, required this.label});

  /// Icon in item, on top.
  final Icon icon;

  /// Label in item, on bottom.
  final String label;
}

/// Navigation bar logic and data.
class MisakaNavigationBarController extends GetxController {
  /// Current selected index of navigation bar.
  final currentIndex = 0.obs;

  /// Items in navigation bar.
  final List<MisakaBarItemWidget> _barItems = <MisakaBarItemWidget>[
    MisakaBarItemWidget(
      icon: const Icon(Icons.upload),
      label: 'Send'.tr,
    ),
    MisakaBarItemWidget(
      icon: const Icon(Icons.download),
      label: 'Receive'.tr,
    ),
    MisakaBarItemWidget(
      icon: const Icon(Icons.settings),
      label: 'Settings'.tr,
    ),
  ];

  /// Getter of [_barItems].
  List<MisakaBarItemWidget> get barItems => _barItems;
}
