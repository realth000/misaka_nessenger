import 'package:flutter/cupertino.dart';

import '../../components/scaffold/scaffold.dart';

class RootPage extends StatelessWidget {
  RootPage({required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return MisakaScaffold();
  }
}
