import 'package:flutter/material.dart';

import '../../components/navigation_bar/navigation_bar_view.dart';
import '../../components/send_payload/add_payload_button_widget.dart';
import '../../pages/scaffold/scaffold_pages_list.dart';
import '../transport_page/mobile_transport_page.dart';

/// App scaffold used in mobile platforms.
///
/// Use [NavigationBarComponent] as navigator widget.
class MobileScaffold extends StatelessWidget {
  /// Constructor.
  const MobileScaffold({required this.index, super.key});

  /// Current index to show in body.
  /// index of [MobileScaffoldPagesList].
  final int index;

  PreferredSizeWidget? _buildAppBarBottom() {
    switch (index) {
      case 0:
        return MobileTransportPage.tabBar;
      default:
        return null;
    }
  }

  Widget? _buildFloatingActionButton() {
    switch (index) {
      case 0:
        return const AddPayloadButton();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('MisakaNessenger'),
          bottom: _buildAppBarBottom(),
        ),
        body: MobileScaffoldPagesList.pages[index],
        bottomNavigationBar: NavigationBarComponent(
          isMobile: true,
        ),
        floatingActionButton: _buildFloatingActionButton(),
      );
}
