import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/misaka_pages.dart';
import 'routes/misaka_routes.dart';
import 'services/payload_service.dart';
import 'services/scaffold_services.dart';
import 'themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MisakaApp());
  doWhenWindowReady(() {
    appWindow.size = const Size(800, 600);
    appWindow.minSize = const Size(800, 600);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

/// Init Getx services, should run before app start.
Future<void> initServices() async {
  await Get.putAsync(() async => ScaffoldService().init());
  await Get.putAsync(() async => PayloadService().init());
}

/// Application class.
class MisakaApp extends StatelessWidget {
  /// Constructor.
  const MisakaApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MisakaNessenger',
        getPages: MisakaPages.pages,
        initialRoute: MisakaRoutes.scaffoldPage,
        theme: flexLight,
        darkTheme: flexDark,
      );
}
