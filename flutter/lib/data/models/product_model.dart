class ProductModel {
  int id;
  String name;
  String description;
  String image;
  double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    return ProductModel(
      id: data["id"],
      name: data["name"] ?? "",
      description: data["description"] ?? "",
      image: data["image"] ?? "",
      price: data["price"] ?? 0,
    );
  }

  static List<ProductModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> dataList = json["data"] ?? [];
    return dataList.map((item) => ProductModel.fromJson(item)).toList();
  }
}
