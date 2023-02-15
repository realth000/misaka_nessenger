import 'package:flutter/material.dart';

import '../../components/send_payload/send_payload_view.dart';

/// Transport page uses in desktop platforms.
///
/// Build with main scaffold and data show in transport page.
class DesktopSendPage extends StatelessWidget {
  /// Constructor.
  DesktopSendPage({super.key});

  /*
                  child: SendPayloadWidget(),
                    child: SendTargetWidget(),
   */
  @override
  Widget build(BuildContext context) => const SendPayloadWidget();
}
