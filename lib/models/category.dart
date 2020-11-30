class Category {
  final int id;
  final String name;
  final String description;
  final String image_url;

  Category({this.id, this.name, this.description, this.image_url});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image_url: json['image_url']);
  }
}
