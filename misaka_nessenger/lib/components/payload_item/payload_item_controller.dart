import 'dart:async';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;

import '../../common/payload_type.dart';

/// Controller of payload item.
///
/// Each payload item holds a [PayloadItemController], use that controller to
/// update status of payload.
class PayloadItemController extends GetxController {
  /// Constructor
  PayloadItemController({required this.filePath, required this.payloadType}) {
    fileName = path.basename(filePath);
    if (payloadType == PayloadType.send) {}
    if (payloadType == PayloadType.receive) {}
  }

  /// File path of the payload item.
  final String filePath;

  /// Task type, a send or receive task.
  final PayloadType payloadType;

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
