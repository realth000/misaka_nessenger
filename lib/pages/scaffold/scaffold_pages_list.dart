import 'package:flutter/cupertino.dart';

import '../../desktop/transport_page/deskop_transport_page.dart';
import '../../mobile/transport_page/mobile_transport_page.dart';
import '../settings_page/settings_page.dart';

/// Pages in app scaffold body.
/// Finally should use different layout on mobile or desktop.
class DesktopScaffoldPagesList {
  /// Page count for status.
  final pageCount = pages.length;

  /// Scaffold body pages.
  static final pages = <Widget>[
    DesktopTransportPage(),
    const SettingsPage(),
  ];
}

/// Pages in app scaffold body.
/// Finally should use different layout on mobile or desktop.
class MobileScaffoldPagesList {
  /// Page count for status.
  final pageCount = pages.length;

  /// Scaffold body pages.
  static final pages = <Widget>[
    MobileTransportPage(),
    const SettingsPage(),
  ];
}
