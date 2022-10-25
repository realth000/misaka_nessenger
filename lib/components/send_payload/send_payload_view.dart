import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/payload_service.dart';

/// Widget to show and set send task payload: file or directory.
///
/// Use both on desktop and mobile platforms.
/// On desktop, use on the right side of send page.
/// On mobile, use in the second tab of send page, looks like "the second step".
class SendPayloadWidget extends GetView<PayloadService> {
  /// Constructor.
  SendPayloadWidget({super.key});

  /// Add payload: pick files from local machine.
  Future<void> _addPayload() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null || result.files.isEmpty) {
      return;
    }
    for (final file in result.files) {
      if (file.path == null ||
          controller.stagedPayloadPathList.contains(file.path)) {
        continue;
      }
      controller.stagedPayloadPathList.add(file.path!);
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 50,
            ),
            child: ElevatedButton(
              onPressed: () async => _addPayload(),
              child: Text(
                'Add file (folder)'.tr,
              ),
            ),
          ),
          SizedBox(
            width: 10,
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemExtent: 50,
                itemCount: controller.stagedPayloadPathList.length,
                itemBuilder: (context, index) =>
                    Text(controller.stagedPayloadPathList[index]),
              ),
            ),
          ),
        ],
      );
}
