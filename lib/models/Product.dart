class Product {
  final int id;
  final String name;
  final String description;
  final String image_url;
  final double price;
  final double discount_price;
  final String unit;

  Product(
      {this.id,
      this.name,
      this.description,
      this.image_url,
      this.price,
      this.discount_price,
      this.unit});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image_url: json['image_url'],
        price: json['price'],
        discount_price: json['discount_price'],
        unit: json['unit']);
  }
}
