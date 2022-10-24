import 'package:flutter/cupertino.dart';

import '../settings_page/settings_page.dart';
import '../transport_page/transport_page.dart';

/// Pages in app scaffold body.
/// Finally should use different layout on mobile or desktop.
class ScaffoldPagesList {
  /// Page count for status.
  final pageCount = pages.length;

  /// Scaffold body pages.
  static final pages = <Widget>[
    TransportPage(),
    const SettingsPage(),
  ];
}
