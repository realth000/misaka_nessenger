import 'package:get/get.dart';

import '../models/transport_item_model/transport_item_model.dart';

/// Filter when showing transport items (tasks) in item list.
///
/// Only show selected items:
/// e.g. Only show items those action are download type when using [onlyDownload].
enum TransportItemFilter {
  /// Show all items.
  all,

  /// Show download items.
  onlyDownload,

  /// Show upload items.
  onlyUpload,
}

/// Record all payload status
class PayloadService extends GetxService {
  /// All payload path list, including files and folders.
  final stagedPayloadPathList = <String>[].obs;

  /// List contains all items (tasks).
  final itemList = <TransportItemModel>[].obs;

  /// Model to display in item.
  /// Clear all stated payload.
  ///
  /// Call this when want to reset the list in send page,
  /// or all payload in that page is pushed into send task queue.
  void clearStagedPayload() {
    stagedPayloadPathList.clear();
  }

  /// Init service when startup.
  Future<PayloadService> init() async {
    return this;
  }
}
