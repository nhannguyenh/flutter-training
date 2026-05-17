import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/di/interceptors/auth_interceptor.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:3000/",
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(authInterceptor);
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
}
