import 'package:flutter/material.dart';

import '../../components/send_payload/send_payload_view.dart';
import '../../components/send_target/send_target_view.dart';
import '../scaffold/scaffold.dart';

/// Transport page.
///
/// Build with [MisakaScaffold] and data show in transport page.
class TransportPage extends StatelessWidget {
  /// Constructor.
  TransportPage({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
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
      );
}
