import 'package:flutter/material.dart';

import '../../components/send_payload/send_payload_view.dart';
import '../../components/send_target/send_target_view.dart';

/// Send page main widget on desktop.
///
/// Control and set send tasks.
class DesktopSendPage extends StatelessWidget {
  /// Constructor.
  const DesktopSendPage({super.key});

  @override
  Widget build(BuildContext context) => Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SendTargetWidget(),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SendPayloadWidget(),
            ),
          ),
        ],
      );
}
