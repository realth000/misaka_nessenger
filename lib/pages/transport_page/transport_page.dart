import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/transport_page/transport_item_list/transport_item_list_controller.dart';
import '../../components/transport_page/transport_item_list/transport_item_list_view.dart';
import '../../components/transport_page/transport_page_controller.dart';
import '../../desktop/transport_page/desktop_transport_page.dart';
import '../scaffold/scaffold.dart';

/// Transport page.
///
/// Build with [MisakaScaffold] and data show in transport page.
class TransportPage extends StatelessWidget {
  /// Constructor.
  TransportPage({super.key});

  /// Controller, maintains different body widgets by
  /// [TransportPageController.currentIndex].
  final controller = Get.put(TransportPageController());

  Widget _buildBodyPage() {
    switch (controller.currentIndex.value) {
      case 0:
      case 1:
        return TransportItemList(
          filter: TransportItemFilter.all,
        );
      case 2:
        return TransportItemList(
          filter: TransportItemFilter.onlyUpload,
        );
      case 3:
      default:
        return TransportItemList(
          filter: TransportItemFilter.onlyDownload,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isMobile) {
      return Row();
    } else {
      return Expanded(
        child: Row(
          children: <Widget>[
            TransportNavigationBar(),
            Expanded(
              child: Scrollbar(
                child: Scrollbar(
                  child: _buildBodyPage(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
