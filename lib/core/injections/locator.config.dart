// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i15;

import 'package:cross_connectivity/cross_connectivity.dart' as _i8;
import 'package:dio/dio.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i20;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i19;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i22;
import '../../features/home/domain/repositories/home_repository.dart' as _i21;
import '../../router/router.dart' as _i7;
import '../../services/jwt/jwt_service.dart' as _i10;
import '../../services/jwt/jwt_service_impl.dart' as _i11;
import '../../services/locale/locale_resources_service.dart' as _i3;
import '../../services/locale/locale_resources_service_impl.dart' as _i4;
import '../../services/network/network_info.dart' as _i12;
import '../../services/network/network_info_impl.dart' as _i13;
import '../../services/network/network_service.dart' as _i17;
import '../../services/network/network_service_impl.dart' as _i18;
import '../models/usecases/base_64_encode.dart' as _i16;
import '../models/usecases/usecase.dart' as _i14;
import 'register_module.dart' as _i23;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.LocaleResourcesService>(
        () => _i4.LocaleResourcesServiceImpl(
              secureStorage: gh<_i5.FlutterSecureStorage>(),
              sharedPreferences: gh<_i6.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i8.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i9.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i10.JwtService>(() => _i11.JwtServiceImpl());
    gh.lazySingleton<_i12.NetworkInfo>(
        () => _i13.NetworkInfoImpl(connectivity: gh<_i8.Connectivity>()));
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i14.UseCase<String, _i15.Uint8List>>(
        () => const _i16.Base64Encode());
    gh.lazySingleton<_i17.NetworkService>(() => _i18.NetworkServiceImpl(
          gh<_i9.Dio>(),
          localeResourcesService: gh<_i3.LocaleResourcesService>(),
          networkInfo: gh<_i12.NetworkInfo>(),
        ));
    gh.lazySingleton<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
          networkService: gh<_i17.NetworkService>(),
          localeResourcesService: gh<_i3.LocaleResourcesService>(),
        ));
    gh.lazySingleton<_i21.HomeRepository>(() => _i22.HomeRepositoryImpl(
          networkService: gh<_i17.NetworkService>(),
          localeResourcesService: gh<_i3.LocaleResourcesService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {
  @override
  _i7.AppRouter get appRouter => _i7.AppRouter();

  @override
  _i8.Connectivity get connectivity => _i8.Connectivity();
}
