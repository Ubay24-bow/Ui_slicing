class Product {
  final String title;
  final String subtitle;
  final int price;
  int quantity;

  Product({
    required this.title,
    required this.subtitle,
    required this.price,
    this.quantity = 0,
  });
}