import 'package:shopping_app/data/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}