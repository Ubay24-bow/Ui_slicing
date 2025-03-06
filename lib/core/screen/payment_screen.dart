import 'package:flutter/material.dart';
import 'package:ui_login/core/data/warna_color.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan', style: TextStyle(fontSize: 16, color: WarnaColor.utama, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    );
  }
}