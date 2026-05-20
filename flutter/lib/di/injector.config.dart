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
import 'package:shopping_app/data/datasources/product_remote_datasource.dart'
    as _i9;
import 'package:shopping_app/data/datasources/user_remote_datasource.dart'
    as _i291;
import 'package:shopping_app/data/helpers/db_helper.dart' as _i443;
import 'package:shopping_app/data/repositories/auth_repository.dart' as _i96;
import 'package:shopping_app/data/repositories/product_repository.dart'
    as _i715;
import 'package:shopping_app/data/repositories/user_repository.dart' as _i549;
import 'package:shopping_app/di/app_module.dart' as _i901;
import 'package:shopping_app/di/interceptors/auth_interceptor.dart' as _i383;
import 'package:shopping_app/domain/repositories/auth_repository_interface.dart'
    as _i90;
import 'package:shopping_app/domain/repositories/product_repository_interface.dart'
    as _i514;
import 'package:shopping_app/domain/repositories/user_repository_interface.dart'
    as _i826;
import 'package:shopping_app/domain/usecases/login_usecase.dart' as _i983;
import 'package:shopping_app/domain/usecases/logout_usecase.dart' as _i701;
import 'package:shopping_app/domain/usecases/product_category_usecase.dart'
    as _i834;
import 'package:shopping_app/domain/usecases/user_profile_usecase.dart'
    as _i1020;
import 'package:shopping_app/presentation/screens/auth/bloc/auth_bloc.dart'
    as _i328;
import 'package:shopping_app/presentation/screens/product/bloc/product_catalog_bloc.dart'
    as _i514;
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_bloc.dart'
    as _i952;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i443.DbHelper>(() => _i443.DbHelper());
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.lazySingleton<_i11.IAuthLocalDataSource>(
      () => _i11.AuthLocalDataSource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i383.AuthInterceptor>(
      () => _i383.AuthInterceptor(gh<_i11.IAuthLocalDataSource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i383.AuthInterceptor>()),
    );
    gh.lazySingleton<_i9.IProductRemoteDataSource>(
      () => _i9.ProductRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i291.IUserRemoteDataSource>(
      () => _i291.UserRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i891.IAuthRemoteDataSource>(
      () => _i891.AuthRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i514.IProductRepository>(
      () => _i715.ProductRepository(
        remoteDataSource: gh<_i9.IProductRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i826.IUserRepository>(
      () => _i549.UserRepository(
        remoteDataSource: gh<_i291.IUserRemoteDataSource>(),
        dbHelper: gh<_i443.DbHelper>(),
      ),
    );
    gh.factory<_i1020.UserProfileUseCase>(
      () => _i1020.UserProfileUseCase(gh<_i826.IUserRepository>()),
    );
    gh.lazySingleton<_i90.IAuthRepository>(
      () => _i96.AuthRepository(
        remoteDataSource: gh<_i891.IAuthRemoteDataSource>(),
        localDataSource: gh<_i11.IAuthLocalDataSource>(),
        dbHelper: gh<_i443.DbHelper>(),
      ),
    );
    gh.factory<_i834.ProductCategoryUseCase>(
      () => _i834.ProductCategoryUseCase(gh<_i514.IProductRepository>()),
    );
    gh.factory<_i952.UserProfileBloc>(
      () => _i952.UserProfileBloc(gh<_i1020.UserProfileUseCase>()),
    );
    gh.factory<_i983.LoginUseCase>(
      () => _i983.LoginUseCase(gh<_i90.IAuthRepository>()),
    );
    gh.factory<_i701.LogoutUseCase>(
      () => _i701.LogoutUseCase(gh<_i90.IAuthRepository>()),
    );
    gh.factory<_i514.ProductCatalogBloc>(
      () => _i514.ProductCatalogBloc(gh<_i834.ProductCategoryUseCase>()),
    );
    gh.factory<_i328.AuthBloc>(
      () => _i328.AuthBloc(gh<_i983.LoginUseCase>(), gh<_i701.LogoutUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i901.RegisterModule {}
