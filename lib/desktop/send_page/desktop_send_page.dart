import 'package:flutter/material.dart';

import '../../components/send_payload/send_payload_view.dart';
import '../../components/send_target/send_target_view.dart';

/// Transport page uses in desktop platforms.
///
/// Build with main scaffold and data show in transport page.
class DesktopSendPage extends StatelessWidget {
  /// Constructor.
  DesktopSendPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: SendPayloadWidget(),
                ),
                const VerticalDivider(
                  width: 2,
                  thickness: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SendTargetWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
