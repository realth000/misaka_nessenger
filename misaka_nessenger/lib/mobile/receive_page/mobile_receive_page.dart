import 'package:flutter/material.dart';

import '../../components/receive_payload/receive_payload_view.dart';

/// Receive files and messages page in mobile platforms.
///
/// Show all receiving and received files and messages.
class MobileReceivePage extends StatelessWidget {
  /// Constructor.
  MobileReceivePage({super.key});

  @override
  Widget build(BuildContext context) => const ReceivePayloadWidget();
}
