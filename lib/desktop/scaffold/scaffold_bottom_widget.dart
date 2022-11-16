import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_themes.dart';
import '../../utils/util_widget.dart';

/// Bottom widget component for desktop platforms.
///
/// Use as bottomNavigationBar in desktop scaffold.
class DesktopScaffoldBottomWidget extends StatelessWidget {
  /// Constructor.
  const DesktopScaffoldBottomWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.brightness == Brightness.dark
              ? flexDark.colorScheme.surface.withOpacity(0.8)
              : flexLight.colorScheme.surface.withOpacity(0.8),
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Text('Local IP:'.tr),
              buildLocalIPTextWidget(),
            ],
          ),
        ),
      );
}
