import 'package:flutter/material.dart';
import 'package:ui_login/core/components/warna_color.dart';
import 'package:ui_login/core/data/order_data.dart';

import 'package:ui_login/core/screen/home/data/product_data.dart';

class OrderScreen extends StatefulWidget {
  final List<Product> selectedProducts;
  final int totalAmount;
  const OrderScreen({
    super.key,
    required this.selectedProducts,
    required this.totalAmount,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedPaymentMethod = 'QRIS'; // Nilai default

  // tipe pembayaran
  final List<String> paymentMethods = ['QRIS', 'Tunai', 'Transfer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            fontSize: 16,
            color: WarnaColor.utama,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: widget.selectedProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.selectedProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp.${product.price} x ${product.quantity}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Rp.${product.price * product.quantity}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                // Bagian Metode Pembayaran
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children:
                  
                      paymentMethods
                          .map((method) => _buildPaymentOption(method))
                          .toList(),
                ),
                const SizedBox(height: 16),
                // Bagian Total & Tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Order Summary',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Rp.${widget.totalAmount}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _processOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WarnaColor.utama,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Process',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildPaymentOption(String method) {
    final isSelected = selectedPaymentMethod == method;
    return GestureDetector( // Aksi ketika suato tombol di klick
      onTap: () => setState(() => selectedPaymentMethod = method),// ketika di klick akan memanggil setState untuk memperbarui input dari selectedPaymentMethod yang dipilih
      child: Container(
        
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          
          color: isSelected ? WarnaColor.utama : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            
            color: isSelected ? WarnaColor.utama : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            method,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _processOrder() {
    // 1. Simpan data pesanan
    final order = OrderData(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      // 1.microsecond = 1 detik = 1.000.000 microsecodn
      // 2.Since itu bisa di artikan sejak atau dimulai adapun Epoch adalah waktu komputer mulai beroprasi pada (1 Januari 1970, 00:00:00 UTC)
      // kesimpulan angka atau number id diambil berdasarkan waktu microsecondsSinceEpoch saat ini dan ini bisa mengalami persamaan nilai ID dari 2 inputan pada waktu bersamaan
      date: DateTime.now(),
      items: widget.selectedProducts,
      totalAmount: widget.totalAmount,
      paymentMethod: selectedPaymentMethod,
    );

    // 2. Tampilkan konfirmasi (Contoh: Navigasi ke layar pembayaran)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderConfirmationScreen(order: order),
      ),
    );
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  final OrderData order;
  const OrderConfirmationScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konfirmasi Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'ID Pesanan: ${order.id}',
            ), // menagambil tipe data dari OrderData berupa id dari microsecondsSinceEpoch
            Text(
              'Metode Pembayaran: ${order.paymentMethod}',
            ), // metode pembayaran yang dipilih
            Text(
              'Total: Rp.${order.totalAmount}',
            ), // total dari product.price * product.quantity
          ],
        ),
      ),
    );
  }
}
