import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payload_item_controller.dart';

/// Payload item widget in UI.
///
/// Each item represents a payload item, shows its status data.
/// Item status data comes from related [PayloadItemController].
class PayloadItemWidget extends StatelessWidget {
  /// Constructor.
  ///
  /// Need to give the name.
  PayloadItemWidget({required String filePath, super.key}) {
    _controller = PayloadItemController(filePath: filePath);
  }

  late final PayloadItemController _controller;

  @override
  Widget build(BuildContext context) => Obx(
        () => ListTile(
          title: Text(_controller.fileName),
          subtitle: LinearProgressIndicator(
            value: _controller.finishedSize.value / _controller.fileSize.value,
          ),
        ),
      );
}
