import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/domain/usecases/login_usecase.dart';
import 'package:shopping_app/presentation/app.dart';
import 'package:shopping_app/presentation/screens/auth/auth_bloc.dart';

import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/secure_storage_service.dart';
import 'data/repositories/auth_repository.dart';
import 'networking/restful/dio_client.dart';

void main() {
  final storage = SecureStorageService();

  final dioClient = DioClient(storage);

  final datasource = AuthRemoteDatasource(dioClient.dio);

  final repository = AuthRepository(datasource, storage);

  final loginUseCase = LoginUseCase(repository);
  runApp(
    BlocProvider(
      create: (_) => AuthBloc(LoginUseCase(repository)),
      child: const MyApp(),
    ),
  );
}
