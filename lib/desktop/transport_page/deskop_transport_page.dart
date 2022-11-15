import 'package:flutter/material.dart';

import '../../components/send_payload/send_payload_view.dart';
import '../../components/send_target/send_target_view.dart';
import '../../utils/util_widget.dart';

/// Transport page uses in desktop platforms.
///
/// Build with main scaffold and data show in transport page.
class DesktopTransportPage extends StatelessWidget {
  /// Constructor.
  DesktopTransportPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          buildLocalIPTextWidget(),
          Expanded(
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SendPayloadWidget(),
                  ),
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
