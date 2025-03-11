import 'package:ui_login/core/screen/home/data/product_data.dart';

class OrderData {
  final String id;
  final DateTime date;
  final List<Product> items;
  final int totalAmount;
  final String paymentMethod;

  OrderData({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
    required this.paymentMethod,
  });
}