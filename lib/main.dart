import 'dart:async';

import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'features/homescreen/screen/homescreen.dart';

void main() {
  runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comfy',
      theme: AppTheme.defaultTheme,
      home: const HomeScreen(),
    );
  }
}
