import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/navigation_bar/navigation_bar_view.dart';
import '../../components/send_target/send_target_view.dart';
import '../../pages/scaffold/scaffold_pages_list.dart';
import '../window_bar_buttons.dart';
import 'scaffold_bottom_widget.dart';

/// Scaffold uses in desktop platforms.
///
/// [NavigationBarComponent] use [NavigationRail] as navigator widget.
class DesktopScaffold extends StatelessWidget {
  /// Constructor.
  const DesktopScaffold({required this.index, super.key});

  /// Current index to show in body.
  /// index of [DesktopScaffoldPagesList].
  final int index;

  Widget? _buildFloatingActionButton() {
    switch (index) {
      case 0:
        return FloatingActionButton(
          onPressed: () async => Get.dialog(SendTargetWidget()),
          child: const Icon(Icons.add),
        );
      // return const AddPayloadButton();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: <Widget>[
            Row(
              children: [
                NavigationBarComponent(
                  isMobile: false,
                ),
                MoveWindow(),
              ],
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  ColoredBox(
                    color: Get.theme.colorScheme.surface.withOpacity(0.8),
                    child: DesktopWindowButtons(),
                  ),
                  Expanded(child: DesktopScaffoldPagesList.pages[index]),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterFloat,
        bottomNavigationBar: const DesktopScaffoldBottomWidget(),
      );
}
