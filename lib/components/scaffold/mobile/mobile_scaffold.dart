import 'package:flutter/material.dart';

import '../../navigation_bar/navigation_bar_view.dart';
import '../pages/scaffold_pages_list.dart';

/// App scaffold used in mobile platforms.
///
/// Use [NavigationBarComponent] as navigator widget.
class MobileScaffold extends StatelessWidget {
  /// Constructor.
  const MobileScaffold({required this.index, super.key});

  /// Current index to show in body.
  /// index of [ScaffoldPagesList].
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldPagesList.pages[index],
      bottomNavigationBar: NavigationBarComponent(
        isMobile: true,
      ),
    );
  }
}
