import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/payload_service.dart';
import '../payload_item/payload_item_view.dart';

/// Widget to show and set send task payload: file or directory.
///
/// Use both on desktop and mobile platforms.
/// On desktop, use on the right side of send page.
/// On mobile, use in the second tab of send page, looks like "the second step".
class SendPayloadWidget extends GetView<PayloadService> {
  /// Constructor.
  const SendPayloadWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemExtent: 50,
                itemCount: controller.workerPool.length,
                itemBuilder: (context, index) => PayloadItemWidget(
                  filePath: controller.workerPool.keys.toList()[index],
                ),
              ),
            ),
          ),
        ],
      );
}
