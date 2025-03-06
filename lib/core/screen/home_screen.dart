import 'package:flutter/material.dart';
import 'package:ui_login/core/data/card_data.dart';
import 'package:ui_login/core/data/product_data.dart';
import 'package:ui_login/core/data/warna_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Product> data = [
      Product(title: 'Tiket masuk Dewasa', subtitle: 'Nusantara', price: 50000),
      Product(title: 'Tiket Masuk Anak', subtitle: 'Nusantara', price: 20000),
      Product(title: 'Tiket Masuk Dewasa', subtitle: 'Mancanegara', price: 150000),
      Product(title: 'Tiket Masuk Anak', subtitle: 'Mancanegara', price: 40000),
    ];
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    int getTotal() {
      int total =0;
      for (var product in data) {
        total += product.price * product.quantity;
      }
      return total;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Penjualan',
            style: TextStyle(
              fontSize: 16,
              color: WarnaColor.utama,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CardData(
                  title: data[index].title, 
                  subTitle: data[index].subtitle, 
                  price: data[index].price, 
                  
                  onQuantityChanged: (value) {
                    setState(() {
                      data[index].quantity = value;
                    });
                  },
                  );
              },
              ),
              ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Sumary', style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp.${getTotal()}',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/bayar');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WarnaColor.utama,
                        
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Process', style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
