import 'package:flutter/material.dart';

import '../../navigation_bar/navigation_bar_view.dart';
import '../pages/scaffold_pages_list.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationBarComponent(
            isMobile: false,
          ),
          ScaffoldPagesList.pages[index],
        ],
      ),
    );
  }
}
