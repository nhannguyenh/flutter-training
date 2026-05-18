import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/data/models/product_model.dart';

abstract class IProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

@LazySingleton(as: IProductRemoteDataSource)
class ProductRemoteDataSource implements IProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get("/product");

      if (response.statusCode == 200) {
        return ProductModel.fromJsonList(response.data);
      } else {
        throw Exception("Cannot get product info");
      }
    } on DioException catch(e) {
      throw Exception(e.response?.data["error"]["message"]);
    }
  }
}