import 'package:flutter/material.dart';

/// Widget to show and set send task payload: file or directory.
///
/// Use both on desktop and mobile platforms.
/// On desktop, use on the right side of send page.
/// On mobile, use in the second tab of send page, looks like "the second step".
class SendPayloadWidget extends StatelessWidget {
  /// Constructor.
  const SendPayloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('send payload wiget')],
    );
  }
}
