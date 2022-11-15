import 'dart:async';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;

import '../../services/payload_service.dart';

/// Controller of payload item.
///
/// Each payload item holds a [PayloadItemController], use that controller to
/// update status of payload.
class PayloadItemController extends GetxController {
  /// Constructor
  PayloadItemController({required this.filePath}) {
    fileName = path.basename(filePath);
    final worker = Get.find<PayloadService>().workerPool[filePath];
    if (worker == null) {
      return;
    }
    fileSize.value = worker.fileSize.toDouble();
    if (worker.finished && worker.succeed) {
      finishedSize.value = fileSize.value;
    } else {
      finishSizeStreamSub = worker.finishSizeStream.listen((size) {
        finishedSize.value = size.toDouble();
      });
    }
  }

  /// File path of the payload item.
  final String filePath;

  /// File name of the payload item.
  late final String fileName;

  /// Size of payload (Bytes).
  final fileSize = 1.0.obs;

  /// Finished size of payload (Bytes).
  final finishedSize = 0.0.obs;

  /// Subscription for finished file size stream;
  late final StreamSubscription<int> finishSizeStreamSub;

  @override
  void onClose() {
    finishSizeStreamSub.cancel();
  }
}
