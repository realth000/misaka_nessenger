import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/send_payload/send_payload_view.dart';
import '../../components/send_target/send_target_view.dart';

/// Transport page uses in desktop platforms.
///
/// Build with main scaffold and data show in transport page.
class MobileTransportPage extends StatelessWidget {
  /// Constructor.
  MobileTransportPage({super.key});

  /// Tab bar to use in app bar.
  static final tabBar = TabBar(
    controller: Get.put(MobileTabController()).controller,
    tabs: [
      Tab(
        text: 'Select Files'.tr,
      ),
      Tab(
        text: 'Network Control'.tr,
      ),
    ],
  );

  final _tabController = Get.put(MobileTabController());

  @override
  Widget build(BuildContext context) => TabBarView(
        controller: _tabController.controller,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10),
            child: SendPayloadWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SendTargetWidget(),
          ),
        ],
      );
}

class MobileTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Transport'.tr),
    Tab(text: 'Settings'.tr),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    controller.dispose();
    super.dispose();
  }
}
