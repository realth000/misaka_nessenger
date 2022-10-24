import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget to show and set send task target.
///
/// Can set remote ip/port, user related info (username, password...)
/// Use both on desktop and mobile platforms.
/// On desktop, use on the left side of send page.
/// On mobile, use in the first tab of send page, looks like "the first step".
class SendTargetWidget extends StatelessWidget {
  /// Constructor.
  SendTargetWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _remoteIPController = TextEditingController();
  final _remotePortController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: false,
            controller: _remoteIPController,
            decoration: InputDecoration(
              labelText: 'Remote IP'.tr,
              hintText: 'xxx.xxx.xxx.xxx'.tr,
            ),
          ),
          SizedBox(
            width: 10,
            height: 10,
          ),
          TextFormField(
            autofocus: false,
            controller: _remotePortController,
            decoration: InputDecoration(
              labelText: 'Remote Port'.tr,
              hintText: '0~65535'.tr,
            ),
          )
        ],
      ),
    );
  }
}
