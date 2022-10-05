import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../navigation_bar/navigation_bar_view.dart';
import '../pages/scaffold_pages_list.dart';
import 'window_bar_buttons.dart';

/// Scaffold uses in desktop platforms.
///
/// [NavigationBarComponent] use [NavigationRail] as navigator widget.
class DesktopScaffold extends StatelessWidget {
  /// Constructor.
  const DesktopScaffold({required this.index, super.key});

  /// Current index to show in body.
  /// index of [ScaffoldPagesList].
  final int index;

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
                  DesktopWindowButtons(),
                  ScaffoldPagesList.pages[index],
                ],
              ),
            ),
          ],
        ),
      );
}
