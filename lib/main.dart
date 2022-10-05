import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/scaffold/services/scaffold_services.dart';
import 'routes/misaka_pages.dart';
import 'routes/misaka_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MisakaApp());
}

/// Init Getx services, should run before app start.
Future<void> initServices() async {
  await Get.putAsync(() async => await ScaffoldService().init());
}

/// Application class.
class MisakaApp extends StatelessWidget {
  /// Constructor.
  const MisakaApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'MisakaNessenger',
        getPages: MisakaPages.pages,
        initialRoute: MisakaRoutes.scaffoldPage,
      );
}
