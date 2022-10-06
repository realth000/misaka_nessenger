import 'package:get/get.dart';

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

/// Controller of transport  item list
///
/// Use this to control show state by updating [filter].
class TransportItemListController extends GetxController {
  /// Filtering items to show.
  final filter = TransportItemFilter.all.obs;
}
