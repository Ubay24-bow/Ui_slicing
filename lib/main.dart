import 'package:flutter/material.dart';
import 'package:ui_login/screen/login_screen.dart';
import 'package:ui_login/screen/ui_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  const UiScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
}
}