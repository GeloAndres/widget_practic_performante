import 'package:flutter/material.dart';
import 'package:widget_app_performance/config/router/app_router.dart';
import 'package:widget_app_performance/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: AppTheme(selectColor: 0).getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
