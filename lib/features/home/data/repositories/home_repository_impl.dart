import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../core/models/failure/failure.dart';
import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/models/lobby.dart';
import '../../domain/repositories/home_repository.dart';
import '../DTOs/game_type/lobby_dto.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  HomeRepositoryImpl({required this.networkService, required this.localeResourcesService});

  @override
  Future<Either<Failure, List<Lobby>>> getLobbies() async {
    final result = await networkService.get(Endpoints.getLobbies);

    return result.fold(
      (l) => left(Failure.unknownError(l.message)),
      (r) => r.data!.extract<List>('channels').fold(
            () => left(const Failure.unknownError("Error extracting lobbies")),
            (lobbies) =>
                right(lobbies.map((lobby) => LobbyDto.fromJson(lobby as Map<String, dynamic>).toDomain()).toList()),
          ),
    );
  }

  @override
  Future<Option<Failure>> sendChallengeRequest({required String userId}) async {
    final result = await networkService.post(Endpoints.sendChallengeRequest(userId: userId));

    return result.fold(
      (l) {
        log(l.message);
        return some(Failure.unknownError(l.message));
      },
      (r) {
        log('CHALLENGE GÖNDERİLDİ');
        return none();
      },
    );
  }

  @override
  Future<Option<Failure>> acceptChallengeRequest({required String challengeRequestId}) async {
    final result = await networkService.post(Endpoints.acceptChallengeRequest(challengeRequestId: challengeRequestId));

    return result.fold(
      (l) => some(Failure.unknownError(l.message)),
      (r) => none(),
    );
  }

  @override
  Future<Option<Failure>> rejectChallengeRequest({required String challengeRequestId}) async {
    final result = await networkService.post(Endpoints.rejectChallengeRequest(challengeRequestId: challengeRequestId));

    return result.fold(
      (l) => some(Failure.unknownError(l.message)),
      (r) {
        log('CHALELNGE REDDEDİLDİ');
        return none();
      },
    );
  }
}
