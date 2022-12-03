import 'package:get/get.dart';

import '../pages/scaffold/scaffold.dart';
import '../pages/server_error/server_error_page.dart';
import 'misaka_routes.dart';

/// Route settings, bind routes together with view classes.
class MisakaPages {
  /// Bind page classes, main pages.
  static final List<GetPage> pages = [
    GetPage(
      name: MisakaRoutes.scaffoldPage,
      page: MisakaScaffold.new,
    ),
    GetPage(
      name: MisakaRoutes.serverErrorPage,
      page: MisakaServerErrorPage.new,
    )
  ];

  /// Pages count, main pages.
  final pageCount = pages.length;
}
