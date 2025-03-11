import 'package:flutter/material.dart';
import 'package:ui_login/core/screen/login_screen.dart';
import 'package:ui_login/core/screen/main_screen.dart';
import 'package:ui_login/core/screen/order_screen.dart';
import 'package:ui_login/core/screen/ui_screen.dart';

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
        '/utama': (context) => const MainScreen(),
        // '/bayar': (context) => const PaymentScreen(),
        
       
        
        
      },
    );
}
}