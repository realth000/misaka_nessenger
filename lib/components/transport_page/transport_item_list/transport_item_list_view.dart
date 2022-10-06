import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/transport_item_model/transport_item_model.dart';
import '../transport_item/transport_item_view.dart';
import 'transport_item_list_controller.dart';

/// Item list to show in transport page.
///
/// Contains of list of items (tasks) of transportation.
/// Set what types of items to show by changing [TransportItemFilter] variable
/// filter in [controller].
class TransportItemList extends StatelessWidget {
  /// Constructor.
  ///
  /// Should specify [filter] to set filtering shown items.
  TransportItemList({required this.filter, super.key});

  /// List contains all items (tasks).
  final itemList = <TransportItemModel>[].obs;

  /// Filter uses in display, on show contained type items.
  final TransportItemFilter filter;

  /// Controller, type is [TransportItemListController].
  final controller = Get.put(TransportItemListController());

  /// Filter items in items list, only types included in [filter] will pass.
  List<TransportItemModel> _filterItemList() {
    switch (filter) {
      case TransportItemFilter.all:
        return itemList;
      case TransportItemFilter.onlyUpload:
        return itemList
            .where((item) => item.action == TransportAction.upload)
            .toList();
      case TransportItemFilter.onlyDownload:
        return itemList
            .where((item) => item.action == TransportAction.download)
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filterItemList();

    return Obx(
      () => ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) => TransportItemWidget(
          model: filteredList[index],
        ),
      ),
    );
  }
}
