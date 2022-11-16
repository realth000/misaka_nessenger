import 'package:flutter/cupertino.dart';

import '../../desktop/receive_page/desktop_receive_page.dart';
import '../../desktop/send_page/desktop_send_page.dart';
import '../../mobile/receive_page/mobile_receive_page.dart';
import '../../mobile/send_page/mobile_send_page.dart';
import '../settings_page/settings_page.dart';

/// Pages in app scaffold body.
/// Finally should use different layout on mobile or desktop.
class DesktopScaffoldPagesList {
  /// Page count for status.
  final pageCount = pages.length;

  /// Scaffold body pages.
  static final pages = <Widget>[
    DesktopSendPage(),
    DesktopReceivePage(),
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
    MobileSendPage(),
    MobileReceivePage(),
    const SettingsPage(),
  ];
}
