import 'package:get/get.dart';

/// Controller of payload item.
///
/// Each payload item holds a [PayloadItemController], use that controller to
/// update status of payload.
class PayloadItemController extends GetxController {
  /// Constructor
  PayloadItemController({required this.name});

  /// Name the payload item.
  final String name;
}
