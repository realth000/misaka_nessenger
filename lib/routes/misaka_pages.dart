import 'package:get/get.dart';

import '../components/scaffold/scaffold.dart';
import 'misaka_routes.dart';

/// Route settings, bind routes together with view classes.
class MisakaPages {
  /// Bind page classes, main pages.
  static final List<GetPage> pages = [
    GetPage(
      name: MisakaRoutes.scaffoldPage,
      page: MisakaScaffold.new,
    ),
  ];

  /// Pages count, main pages.
  final pageCount = pages.length;
}
