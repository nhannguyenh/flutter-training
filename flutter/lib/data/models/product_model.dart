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

  factory ProductModel.fromJson(Map<String, dynamic> item) {
    return ProductModel(
      id: item["id"],
      name: item["name"] ?? "",
      description: item["description"] ?? "",
      image: item["image"] ?? "",
      price: (item["price"] ?? 0).toDouble(),
    );
  }

  static List<ProductModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> dataList = json["data"] ?? [];
    return dataList.map((item) => ProductModel.fromJson(item)).toList();
  }
}
