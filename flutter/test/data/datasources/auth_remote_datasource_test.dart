import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:shopping_app/data/datasources/auth_remote_datasource.dart";
import "package:shopping_app/data/models/user_model.dart";

@GenerateMocks([Dio])
import "auth_remote_datasource_test.mocks.dart";

void main() {
  late AuthRemoteDataSource authRemoteDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    authRemoteDataSource = AuthRemoteDataSource(mockDio);
  });

  const username = "testuser";
  const password = "password123";
  const loginPath = "/login";
  const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoiamFja2llIiwiaWF0IjoxNzc5MjcwOTM4LCJleHAiOjE3NzkyNzQ1Mzh9.zMmtQG0xS6eS09P312naszziJPepWbf9FHFcsJx7cLY";

  final user = {
    "data": {
      "token": token,
      "user": {"username": username},
    },
  };

  group("login", () {
    test("should return UserModel when the response code is 200", () async {
      when(
        mockDio.post(
          loginPath,
          data: {"username": username, "password": password},
        ),
      ).thenAnswer(
        (_) async => Response(
          data: user,
          statusCode: 200,
          requestOptions: RequestOptions(path: loginPath),
        ),
      );

      final result = await authRemoteDataSource.login(username, password);

      expect(result, isA<UserModel>());
      expect(result.username, username);
      expect(result.token, token);
      verify(
        mockDio.post(
          loginPath,
          data: {"username": username, "password": password},
        ),
      ).called(1);
    });

    test(
      "should throw an Exception when the response code is not 200",
      () async {
        when(
          mockDio.post(
            loginPath,
            data: {"username": username, "password": password},
          ),
        ).thenAnswer(
          (_) async => Response(
            data: "Something went wrong",
            statusCode: 400,
            requestOptions: RequestOptions(path: loginPath),
          ),
        );

        expect(
          () => authRemoteDataSource.login(username, password),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Login failed",
            ),
          ),
        );
      },
    );

    test(
      "should throw Exception with API error message when DioException occurs",
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: loginPath),
          response: Response(
            statusCode: 401,
            data: {
              "error": {"message": "Invalid credentials"},
            },
            requestOptions: RequestOptions(path: loginPath),
          ),
          type: DioExceptionType.badResponse,
        );

        when(
          mockDio.post(
            loginPath,
            data: {"username": username, "password": password},
          ),
        ).thenThrow(dioException);

        expect(
          () => authRemoteDataSource.login(username, password),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Invalid credentials",
            ),
          ),
        );
      },
    );

    test(
      "should throw default Exception message when DioException occurs without backend message",
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: loginPath),
          type: DioExceptionType.connectionTimeout,
        );

        when(
          mockDio.post(
            loginPath,
            data: {"username": username, "password": password},
          ),
        ).thenThrow(dioException);

        expect(
          () => authRemoteDataSource.login(username, password),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Server connection issue",
            ),
          ),
        );
      },
    );
  });
}
