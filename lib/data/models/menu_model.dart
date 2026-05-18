class MenuModel {
  final String id;
  final String name;
  final String description;
  final double price;

  MenuModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
    };
  }
}