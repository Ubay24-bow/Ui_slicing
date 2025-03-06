import 'package:flutter/material.dart';

class CardData extends StatefulWidget {
  final String title;
  final String subTitle;
  final int price;
  final Function(int) onQuantityChanged; //parameter hanya penamaan saja, ini defauld dari flutter

  const CardData({
    Key? key,
     required this.title,
      required this.subTitle,
       required this.price,
        required this.onQuantityChanged,
        }) : super(key: key);

  @override
  State<CardData> createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  
  int quantity = 0;

// jika kondisi penjumlahan pada pesanan quantity-> berperan sebagai penjumlahan +(increment)
  void increment() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

// jika kondisi pengurangan pada pesanan quantity-> berperan sebagai pengurangan -(dec) sebagai kondisi ke 2 
  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        widget.onQuantityChanged(quantity);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildCounterButton(Icons.remove, decrement),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  _buildCounterButton(Icons.add, increment),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp. ${widget.price.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp. ${(widget.price * quantity).toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}