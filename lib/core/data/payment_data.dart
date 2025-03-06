import 'package:flutter/material.dart';

class PaymentData extends StatefulWidget {
  final String judul;
  final String deskripsi;
  final int harga;
  final Function(int) onUpdate; 
  const PaymentData({
    Key? key, 
    required this.judul, 
    required this.deskripsi, 
    required this.harga, 
    required this.onUpdate,
    }) : super(key: key);

  @override
  State<PaymentData> createState() => _PaymentDataState();
}

class _PaymentDataState extends State<PaymentData> {
  int quantity = 0;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1)
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('tobecontinue')
            ],
          )
        ],
      ),
    );
  }
}