import 'package:dio/dio.dart';
import 'package:shopping_app/data/datasources/secure_storage_service.dart';

class DioClient {
  final Dio dio;
  final SecureStorageService secureStorage;

  DioClient(this.secureStorage) : dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15)
    ),
  ) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await secureStorage.getToken();

        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },

      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          // logout if token expired
        }
        return handler.next(error);
      }
    ));
  }
}
