import 'package:shopping_app/data/models/product_model.dart';

abstract class ProductCatalogState {}

class ProductCatalogInitial extends ProductCatalogState {}

class ProductCatalogLoading extends ProductCatalogState {}

class ProductCatalogLoaded extends ProductCatalogState {
  final List<ProductModel> productModels;

  ProductCatalogLoaded(this.productModels);
}

class ProductCatalogError extends ProductCatalogState {
  final String errorMessage;

  ProductCatalogError(this.errorMessage);
}
