import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/datasources/product_remote_datasource.dart';
import 'package:shopping_app/data/models/product_model.dart';
import 'package:shopping_app/domain/repositories/product_repository_interface.dart';

@LazySingleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final IProductRemoteDataSource remoteDataSource;

  ProductRepository({required this.remoteDataSource});

  @override
  Future<List<ProductModel>> getProducts() async {
    return await remoteDataSource.getProducts();
  }

}