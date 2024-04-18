// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:word_game/constants/api_endpoints.dart';
import 'package:word_game/core/models/failure/failure.dart';

import '../../../../constants/failure_message.dart';
import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  AuthRepositoryImpl({required this.networkService, required this.localeResourcesService});

  @override
  Future<bool> isTokenExpired() async {
    final token = await localeResourcesService.getAccessToken();

    if (token.isNone()) return true;

    // final isExpired = JwtDecoder.isExpired(token.toNullable()!);
    const isExpired = true;

    if (isExpired) {
      await localeResourcesService.clearSecureStorage();
    }
    // else {
    //   log(token.toNullable() ?? "Token is null");
    //   networkService.setToken(token.toNullable()!);
    // }

    return isExpired;
  }

  @override
  Future<Option<Failure>> login({required String username, required String password}) async {
    final result = await networkService.post(
      Endpoints.login,
      data: {
        "password": password,
        "userName": username,
      },
    );
    return result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => optionOf(r.data).fold(
        () => some(Failure.unknownError(unknownErrorMessage)),
        (data) {
          return data.extractMap('token').fold(
                () => some(Failure.unknownError(unknownErrorMessage)),
                (tokenData) => tokenData.extract<String>('accessToken').fold(
                  () => some(Failure.unknownError(unknownErrorMessage)),
                  (accessToken) async {
                    try {
                      log(accessToken);
                      networkService.setToken(accessToken);

                      await localeResourcesService.setAccessToken(accessToken);
                      final userId = data['passwordLoginResult']['userId'] as String;
                      await localeResourcesService.setUserId(userId);

                      return none();
                    } catch (e) {
                      return some(Failure.unknownError(unknownErrorMessage));
                    }
                  },
                ),
              );
        },
      ),
    );
  }

  @override
  Future<Option<Failure>> signUp({required String username, required String password}) async {
    final result = await networkService.post(
      Endpoints.signUp,
      data: {
        "password": password,
        "userName": username,
        "emailAddress": "{$username}@asd.com",
        "appName": "WordGame",
      },
    );
    return result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => none(),
    );
  }
}
