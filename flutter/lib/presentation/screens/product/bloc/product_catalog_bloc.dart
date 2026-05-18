import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/domain/usecases/product_category_usecase.dart';
import 'package:shopping_app/presentation/screens/product/bloc/product_catalog_event.dart';
import 'package:shopping_app/presentation/screens/product/bloc/product_catalog_state.dart';

@injectable
class ProductCatalogBloc extends Bloc<ProductCatalogEvent, ProductCatalogState> {
  final ProductCategoryUseCase _productCategoryUseCase;

  ProductCatalogBloc(this._productCategoryUseCase) : super(ProductCatalogInitial()) {
    on<FetchProductCatalogData>(_onFetchProductCatalogData);
  }

  Future<void> _onFetchProductCatalogData(FetchProductCatalogData event, Emitter emit) async {
    emit(ProductCatalogLoading());

    try {
      final products = await _productCategoryUseCase.getProducts();
      emit(ProductCatalogLoaded(products));
    } catch(e) {
      emit(ProductCatalogError(e.toString()));
    }
  }
}
