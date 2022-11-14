import 'package:flutter/material.dart';

import 'payload_item_controller.dart';

/// Payload item widget in UI.
///
/// Each item represents a payload item, shows its status data.
/// Item status data comes from related [PayloadItemController].
class PayloadItemWidget extends StatelessWidget {
  /// Constructor.
  ///
  /// Need to give the name.
  PayloadItemWidget({required String name, super.key}) {
    _controller = PayloadItemController(name: name);
  }

  late final PayloadItemController _controller;

  @override
  Widget build(BuildContext context) => Text(_controller.name);
}
