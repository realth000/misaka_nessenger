import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;

import 'transport_item_type.dart';

/// Transport action types.
enum TransportAction {
  /// Indicate is a download action.
  download,

  /// Indicate is a upload action.
  upload,
}

/// Model of transport item.
///
/// Contains all info related to item.
class TransportItemModel {
  /// Constructor.
  TransportItemModel(
    this.relatedUrl,
    this.relatedPath,
    this.action,
    this.size,
  ) {
    type = detectType(relatedPath);
    icon = transportItemIconMap[type]!;
    name = path.basename(relatedPath);
  }

  /// Related url in transport.
  ///
  /// * Download url in download.
  /// * Upload url in upload.
  /// Not the file stored path.
  final String relatedUrl;

  /// Related path in transport, always the file path on local machine.
  ///
  /// * Download to which location in download.
  /// * From where to get the file in upload.
  final String relatedPath;

  /// Indicate this item's action.
  final TransportAction action;

  /// File type.
  ///
  /// Enum [TransportItemType].
  late final TransportItemType type;

  /// Item icon, defined according to [type].
  late final IconData icon;

  /// File size in bytes.
  final int size;

  /// File name.
  late final String name;
}
