// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shopping_app/data/datasources/auth_local_datasource.dart'
    as _i11;
import 'package:shopping_app/data/datasources/auth_remote_datasource.dart'
    as _i891;
import 'package:shopping_app/data/repositories/auth_repository.dart' as _i96;
import 'package:shopping_app/di/app_module.dart' as _i901;
import 'package:shopping_app/di/interceptors/auth_interceptor.dart' as _i383;
import 'package:shopping_app/domain/repositories/auth_repository_interface.dart'
    as _i90;
import 'package:shopping_app/domain/usecases/login_usecase.dart' as _i983;
import 'package:shopping_app/presentation/screens/login/bloc/login_bloc.dart'
    as _i556;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.lazySingleton<_i11.IAuthLocalDatasource>(
      () => _i11.AuthLocalDatasource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i383.AuthInterceptor>(
      () => _i383.AuthInterceptor(gh<_i11.IAuthLocalDatasource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i383.AuthInterceptor>()),
    );
    gh.lazySingleton<_i891.IAuthRemoteDatasource>(
      () => _i891.AuthRemoteDatasource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i90.IAuthRepository>(
      () => _i96.AuthRepository(
        remoteDatasource: gh<_i891.IAuthRemoteDatasource>(),
        localDatasource: gh<_i11.IAuthLocalDatasource>(),
      ),
    );
    gh.factory<_i983.LoginUseCase>(
      () => _i983.LoginUseCase(gh<_i90.IAuthRepository>()),
    );
    gh.factory<_i556.LoginBloc>(
      () => _i556.LoginBloc(gh<_i983.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i901.RegisterModule {}
