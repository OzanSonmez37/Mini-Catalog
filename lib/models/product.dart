class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String emoji;
  final int color;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.emoji,
    required this.color,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      emoji: json['emoji'],
      color: int.parse(json['color'].toString()),
    );
  }
}
