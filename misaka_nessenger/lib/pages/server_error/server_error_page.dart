import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../../common/init.dart';

/// Page that shows when MisakaNessengerServer failed to start.
class MisakaServerErrorPage extends StatelessWidget {
  /// Constructor.
  const MisakaServerErrorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('MisakaNessenger'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Server failed to start, try restart app'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Get.deleteAll(force: true);
                  await initServices();
                  await Phoenix.rebirth(Get.context!);
                  // Get.reset();
                  await Get.offAllNamed(getInitialRoute());
                },
                child: Text('Restart MisakaNessenger'.tr),
              ),
            ],
          ),
        ),
      );
}
