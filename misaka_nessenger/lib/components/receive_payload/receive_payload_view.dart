import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/payload_type.dart';
import '../../services/payload_service.dart';
import '../payload_item/payload_item_view.dart';

/// Show a payload task type is receive to UI.
class ReceivePayloadWidget extends GetView<PayloadService> {
  /// Constructor.
  const ReceivePayloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pool = controller.connectionPool();
    if (pool == null) {
      return Center(
        child: Text('No receive task'.tr),
      );
    }
    return Obx(
      () => ListView.builder(
        itemExtent: 50,
        itemCount: pool.length,
        itemBuilder: (context, index) => PayloadItemWidget(
          filePath: pool.keys.toList()[index],
          payloadType: PayloadType.receive,
        ),
      ),
    );
  }
}
