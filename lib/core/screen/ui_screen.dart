import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_login/core/screen/login_screen.dart';

class UiScreen extends StatefulWidget {
  const UiScreen({super.key});

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {
  @override
  void initState(){
    super.initState();
  Timer(const Duration(seconds: 2), (){
    Navigator.pushNamed(context, '/login');
  });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           
            const Spacer(),
            
        
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'QuickTix',
                    style: TextStyle(
                      fontSize: 45,
                      color: Color(0xff3949AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Making Ticketing a Breeze!',
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            
          
            const Spacer(),
            
           
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  const Text(
                    'from',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    'assets/logo1.png',
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}