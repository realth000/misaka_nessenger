import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/payload_service.dart';

/// Button to select files and add to UI/[PayloadService].
///
/// On desktop platforms, it's always shown as a floating button in scaffold.
/// On mobile platforms, it shows when in payload item page.
class AddPayloadButton extends GetView<PayloadService> {
  /// Constructor.
  const AddPayloadButton({super.key});

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
      controller.addWorker(file.path!);
    }
  }

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: _addPayload,
        child: const Icon(Icons.add),
      );
}
