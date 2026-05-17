import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasources/auth_local_datasource.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final IAuthLocalDatasource _localDatasource;

  AuthInterceptor(this._localDatasource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains("/login")) {
      return handler.next(options);
    }

    final token = await _localDatasource.getToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }
}