import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/config_service.dart';
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
  late final _remoteIPController = TextEditingController(
    text: Get.find<ConfigService>().getString('LastUsedRemoteHost') ?? '',
  );
  late final _remotePortController = TextEditingController(
    text: _loadRemotePortConfig(),
  );

  String _loadRemotePortConfig() {
    final v = Get.find<ConfigService>().getInt('LastUsedRemotePort');
    if (v == null) {
      return '10032';
    }
    return v.toString();
  }

  Future<void> _checkAndSend() async {
    if (_formKey.currentState == null || !(_formKey.currentState!).validate()) {
      return;
    }
    // Save config.
    final configService = Get.find<ConfigService>();
    await configService.saveString(
      'LastUsedRemoteHost',
      _remoteIPController.text,
    );
    await configService.saveInt(
      'LastUsedRemotePort',
      int.parse(_remotePortController.text),
    );

    final payloadService = Get.find<PayloadService>();
    if (payloadService.stagedPayloadPathList.isEmpty) {
      print('AAAA send button empty!');
      return;
    }
    if (!await payloadService.startSendFile(
      remoteHost: _remoteIPController.text,
      remotePort: int.parse(_remotePortController.text),
    )) {
      print('AAAA send button failed!');
    }
    print('AAAA send button finished!');
  }

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
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return 'Remote IP Can not be empty'.tr;
                    }
                    if (!v.isIPv4 && v != 'localhost') {
                      return 'Invalid IP'.tr;
                    }
                    return null;
                  },
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
                  validator: (v) {
                    if (v == null) {
                      return 'Remote port can not be empty'.tr;
                    }
                    final intValue = int.tryParse(v);
                    if (intValue == null) {
                      return 'Invalid remote port'.tr;
                    }
                    if (intValue < 0 || intValue > 65535) {
                      return 'Remote port should be in 0~65535'.tr;
                    }
                    return null;
                  },
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
                      onPressed: _checkAndSend,
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
