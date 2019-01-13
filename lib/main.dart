import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColor: Colors.orange,
      accentColor: Colors.cyan[400],
      scaffoldBackgroundColor: Color(0xff0c1d39),
      // scaffoldBackgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter Template',
      theme: _buildTheme(),
      home: HomePage(),
    );
  }
}
