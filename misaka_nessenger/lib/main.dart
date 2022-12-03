import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'routes/misaka_pages.dart';
import 'routes/misaka_routes.dart';
import 'services/config_service.dart';
import 'services/locale_service.dart';
import 'services/payload_service.dart';
import 'services/scaffold_services.dart';
import 'services/server_bridge_service.dart';
import 'themes/app_themes.dart';
import 'translations/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    Phoenix(
      child: const MisakaApp(),
    ),
  );
  if (GetPlatform.isDesktop) {
    doWhenWindowReady(() {
      appWindow.size = const Size(800, 600);
      appWindow.minSize = const Size(800, 600);
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
  if (GetPlatform.isAndroid) {
    if (!await Permission.storage.isGranted &&
        !await Permission.storage.request().isGranted) {
      Get.rawSnackbar(
        title: 'Permission required'.tr,
        message: 'Need permission to access download directory.'.tr,
      );
    }
  }
}

/// Init Getx services, should run before app start.
Future<void> initServices() async {
  await Get.putAsync(() async => ConfigService().init());
  await Get.putAsync(() async => LocaleService().init());
  await Get.putAsync(() async => ServerBridgeService().init());
  await Get.putAsync(() async => ScaffoldService().init());
  await Get.putAsync(() async => PayloadService().init());
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

/// Application class.
class MisakaApp extends StatelessWidget {
  /// Constructor.
  const MisakaApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'MisakaNessenger',
        getPages: MisakaPages.pages,
        initialRoute: getInitialRoute(),
        theme: flexLight,
        darkTheme: flexDark,
        translations: MisakaTranslations(),
        locale: Get.find<LocaleService>().getLocale(),
        fallbackLocale: LocaleService.fallbackLocale,
      );
}
