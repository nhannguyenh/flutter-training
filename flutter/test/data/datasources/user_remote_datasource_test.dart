import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:shopping_app/data/datasources/user_remote_datasource.dart";
import "package:shopping_app/data/models/user_profile_model.dart";

@GenerateMocks([Dio])
import "user_remote_datasource_test.mocks.dart";

void main() {
  late UserRemoteDataSource userRemoteDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    userRemoteDataSource = UserRemoteDataSource(mockDio);
  });

  const username = "johndoe123";
  const firstName = "John";
  const lastName = "Doe";
  const email = "johndoe@example.com";
  const age = 25;

  const userPath = "/user";

  final userProfile = {
    "data": {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "age": age,
    },
  };

  group("getUserProfile", () {
    test(
      "should return UserProfileModel when the response code is 200",
      () async {
        when(mockDio.get(userPath)).thenAnswer(
          (_) async => Response(
            data: userProfile,
            statusCode: 200,
            requestOptions: RequestOptions(path: userPath),
          ),
        );

        final result = await userRemoteDataSource.getUserProfile();

        expect(result, isA<UserProfileModel>());
        expect(result.username, username);
        expect(result.firstName, firstName);
        expect(result.lastName, lastName);
        expect(result.email, email);
        expect(result.age, age);
        verify(mockDio.get(userPath)).called(1);
      },
    );

    test(
      "should throw an Exception when the response code is not 200",
      () async {
        when(mockDio.get(userPath)).thenAnswer(
          (_) async => Response(
            data: "Unauthorized",
            statusCode: 401,
            requestOptions: RequestOptions(path: userPath),
          ),
        );

        expect(
          () => userRemoteDataSource.getUserProfile(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: Cannot get user info",
            ),
          ),
        );
      },
    );

    test(
      "should throw Exception with API error message when a DioException occurs with custom message",
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: userPath),
          response: Response(
            statusCode: 400,
            data: {
              "error": {"message": "User session expired"},
            },
            requestOptions: RequestOptions(path: userPath),
          ),
          type: DioExceptionType.badResponse,
        );

        when(mockDio.get(userPath)).thenThrow(dioException);

        expect(
          () => userRemoteDataSource.getUserProfile(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              "message",
              "Exception: User session expired",
            ),
          ),
        );
      },
    );
  });
}
