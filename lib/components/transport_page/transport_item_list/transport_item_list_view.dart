import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/transport_item_model/transport_item_model.dart';
import '../../../services/payload_service.dart';
import '../transport_item/transport_item_view.dart';

/// Item list to show in transport page.
///
/// Contains of list of items (tasks) of transportation.
/// Set what types of items to show by changing [TransportItemFilter] variable
/// filter in [controller].
class TransportItemList extends GetView<PayloadService> {
  /// Constructor.
  ///
  /// Should specify [filter] to set filtering shown items.
  TransportItemList({required this.filter, super.key});

  /// Filter uses in display, on show contained type items.
  final TransportItemFilter filter;

  /// Filter items in items list, only types included in [filter] will pass.
  List<TransportItemModel> _filterItemList() {
    switch (filter) {
      case TransportItemFilter.all:
        return controller.itemList;
      case TransportItemFilter.onlyUpload:
        return controller.itemList
            .where((item) => item.action == TransportAction.upload)
            .toList();
      case TransportItemFilter.onlyDownload:
        return controller.itemList
            .where((item) => item.action == TransportAction.download)
            .toList();
    }
  }

  /// FIXME: Not efficient because call [_filterItemList] too many times.
  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          itemCount: _filterItemList().length,
          itemBuilder: (context, index) => TransportItemWidget(
            model: _filterItemList()[index],
          ),
        ),
      );
}
