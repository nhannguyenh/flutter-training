import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/models/product_model.dart';
import 'package:shopping_app/domain/repositories/product_repository_interface.dart';

@injectable
class ProductCategoryUseCase {
  final IProductRepository repository;

  ProductCategoryUseCase(this.repository);

  Future<List<ProductModel>> getProducts() {
    return repository.getProducts();
  }
}