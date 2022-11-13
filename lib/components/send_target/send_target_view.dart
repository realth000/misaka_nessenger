import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/payload_service.dart';

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
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _remoteIPController,
                  decoration: InputDecoration(
                    labelText: 'Remote IP'.tr,
                    hintText: 'xxx.xxx.xxx.xxx'.tr,
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                TextFormField(
                  controller: _remotePortController,
                  decoration: InputDecoration(
                    labelText: 'Remote Port'.tr,
                    hintText: '0~65535'.tr,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        print('AAAA send button clicked!');
                        final payloadService = Get.find<PayloadService>();
                        if (payloadService.stagedPayloadPathList.isEmpty) {
                          print('AAAA send button empty!');
                          return;
                        }
                        if (!await payloadService.startSendFile(
                          remoteHost: 'localhost',
                          remotePort: 10032,
                        )) {
                          print('AAAA send button failed!');
                        }
                        print('AAAA send button finished!');
                      },
                      child: Text('Send'.tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
