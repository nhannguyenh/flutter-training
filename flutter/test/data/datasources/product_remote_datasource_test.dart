import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:shopping_app/data/datasources/product_remote_datasource.dart";
import "package:shopping_app/data/models/product_model.dart";

@GenerateMocks([Dio])
import "product_remote_datasource_test.mocks.dart";

void main() {
  late ProductRemoteDataSource productRemoteDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    productRemoteDataSource = ProductRemoteDataSource(mockDio);
  });

  const productPath = "/product";

  final products = {
    "data": [
      {
        "id": 1,
        "name": "Sample Product 1",
        "description": "Description 1",
        "image": "image_url_1",
        "price": 29.99,
      },
      {
        "id": 2,
        "name": "Sample Product 2",
        "description": "Description 2",
        "image": "image_url_2",
        "price": 49.99,
      },
    ],
  };

  group("getProducts", () {
    test(
      "should return a List of ProductModel when the response code is 200",
      () async {
        when(mockDio.get(productPath)).thenAnswer(
          (_) async => Response(
            data: products,
            statusCode: 200,
            requestOptions: RequestOptions(path: productPath),
          ),
        );

        final result = await productRemoteDataSource.getProducts();

        expect(result, isA<List<ProductModel>>());
        expect(result.length, 2);
        expect(result[0].name, "Sample Product 1");
        verify(mockDio.get(productPath)).called(1);
      },
    );

    test(
      "should throw an Exception when the response code is not 200",
      () async {
        when(mockDio.get(productPath)).thenAnswer(
          (_) async => Response(
            data: "Internal Server Error",
            statusCode: 500,
            requestOptions: RequestOptions(path: productPath),
          ),
        );

        expect(
          () => productRemoteDataSource.getProducts(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Cannot get product info",
            ),
          ),
        );
      },
    );

    test(
      "should throw Exception with API error message when a DioException occurs with custom message",
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: productPath),
          response: Response(
            statusCode: 400,
            data: {
              "error": {"message": "Invalid product category request"},
            },
            requestOptions: RequestOptions(path: productPath),
          ),
          type: DioExceptionType.badResponse,
        );

        when(mockDio.get(productPath)).thenThrow(dioException);

        expect(
          () => productRemoteDataSource.getProducts(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Invalid product category request",
            ),
          ),
        );
      },
    );
  });
}
