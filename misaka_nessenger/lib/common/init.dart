import 'package:get/get.dart';

import '../routes/misaka_routes.dart';
import '../services/config_service.dart';
import '../services/locale_service.dart';
import '../services/payload_service.dart';
import '../services/scaffold_services.dart';
import '../services/server_bridge_service.dart';

/// Init Getx services, should run before app start.
Future<void> initServices() async {
  await Get.putAsync(() async => ConfigService().init());
  await Get.putAsync(() async => LocaleService().init());
  await Get.putAsync(() async => ScaffoldService().init());
  await Get.putAsync(() async => PayloadService().init());
  await Get.putAsync(() async => ServerBridgeService().init());
}

/// Get the initial route for MisakaApp.
String getInitialRoute() {
  switch (Get.find<ServerBridgeService>().serverStatus) {
    case RunningStatus.running:
      return MisakaRoutes.scaffoldPage;
    case RunningStatus.unknown:
    case RunningStatus.closed:
      return MisakaRoutes.serverErrorPage;
  }
}
