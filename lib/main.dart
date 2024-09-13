import 'package:flutter/material.dart';
import 'package:pruyeba_tecnica_pragma/presentation/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Breeds',
      home:
          const SplashScreen(), // Establece el SplashScreen como la pantalla inicial
    );
  }
}
