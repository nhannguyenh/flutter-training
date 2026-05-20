import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app/data/datasources/auth_remote_datasource.dart';

@GenerateMocks([Dio])
import 'auth_remote_datasource_test.mocks.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = AuthRemoteDataSource(mockDio);
  });

  group("AuthRemoteDataSource - Login", () {
    const username = "test";
    const password = "password123";
    const path = "/login";

    final tRequestData = {
      "username": username,
      "password": password,
    };

    final response = {
      "id": 1,
      "username": "test",
      "email": "test@example.com",
    };

    test("should throw Exception when occur DioException badResponse", () async {
      when(mockDio.post(path, data: tRequestData)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: path),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: path),
            statusCode: 401,
            data: {
              "error": {
                "message": "Invalid credentials"
              }
            },
          ),
        ),
      );

      final call = dataSource.login(username, password);

      expect(() => call,
        throwsA(isA<Exception>().having((e) => e.toString(),
          "message",
          contains("Invalid credentials"),
        )),
      );
    });

    test("should throw Exception('Server connection issue') when server has connection issue", () async {
      when(mockDio.post(path, data: tRequestData)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: path),
          type: DioExceptionType.connectionTimeout,
          response: null,
        ),
      );

      final call = dataSource.login(username, password);

      expect(() => call,
        throwsA(isA<Exception>().having((e) => e.toString(),
          "message",
          contains("Server connection issue"),
        )),
      );
    });
  });
}