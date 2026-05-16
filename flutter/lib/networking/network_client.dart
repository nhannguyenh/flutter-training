import 'package:dio/dio.dart';

class NetworkClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3000",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15)
    )
  );

  static Dio get instance => _dio;
}