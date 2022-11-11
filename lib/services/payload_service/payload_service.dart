import 'package:get/get.dart';

import '../../models/transport_item_model/transport_item_model.dart';
import 'payload_worker.dart';

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

  /// Worker of all tasks,
  final workerPool = <PayloadWorker>[];

  /// Model to display in item.
  /// Clear all stated payload.
  ///
  /// Call this when want to reset the list in send page,
  /// or all payload in that page is pushed into send task queue.
  void clearStagedPayload() {
    stagedPayloadPathList.clear();
  }

  /// Add a send task, send text or file to other machines.
  Future<void> addSendTask(List<String> taskSourcePathList) async {
    // TODO: Multiple tasks.
    for (final task in taskSourcePathList) {
      final worker = PayloadWorker.fromSource(
        source: task,
        type: PayloadType.send,
        id: workerPool.length,
      );
      workerPool.add(worker);
    }
  }

  /// Init service when startup.
  Future<PayloadService> init() async {
    return this;
  }
}
