import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app/data/datasources/auth_local_datasource.dart';

@GenerateMocks([FlutterSecureStorage])
import 'auth_local_datasource_test.mocks.dart';

void main() {
  late AuthLocalDataSource dataSource;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    dataSource = AuthLocalDataSource(mockSecureStorage);
  });

  group("Secure Token Management", () {
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoiamFja2llIiwiaWF0IjoxNzc5MjcwOTM4LCJleHAiOjE3NzkyNzQ1Mzh9.zMmtQG0xS6eS09P312naszziJPepWbf9FHFcsJx7cLY";
    const tokenKey = "jwtToken";

    group("saveToken", () {
      test(
        "should call FlutterSecureStorage to save token successfully",
        () async {
          when(
            mockSecureStorage.write(key: tokenKey, value: token),
          ).thenAnswer((_) async => {});

          await dataSource.saveToken(token);

          verify(
            mockSecureStorage.write(key: tokenKey, value: token),
          ).called(1);
        },
      );
    });

    group("getToken", () {
      test(
        "should return token from FlutterSecureStorage when token is existed",
        () async {
          when(
            mockSecureStorage.read(key: tokenKey),
          ).thenAnswer((_) async => token);

          final result = await dataSource.getToken();

          expect(result, equals(token));
          verify(mockSecureStorage.read(key: tokenKey)).called(1);
        },
      );

      test(
        "should return null when token cannot be found in secure storage",
        () async {
          when(
            mockSecureStorage.read(key: tokenKey),
          ).thenAnswer((_) async => null);

          final result = await dataSource.getToken();

          expect(result, isNull);
          verify(mockSecureStorage.read(key: tokenKey)).called(1);
        },
      );
    });

    group("clearSession", () {
      test("should clear token when user logouts", () async {
        when(
          mockSecureStorage.delete(key: tokenKey),
        ).thenAnswer((_) async => {});

        await dataSource.clearToken();

        verify(mockSecureStorage.delete(key: tokenKey)).called(1);
      });
    });
  });
}
