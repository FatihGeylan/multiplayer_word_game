import 'package:fpdart/fpdart.dart';
import 'package:word_game/core/models/failure/failure.dart';
import 'package:word_game/features/home/domain/models/lobby.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Lobby>>> getLobbies();
  Future<Option<Failure>> sendChallengeRequest({required String userId});
  Future<Option<Failure>> acceptChallengeRequest({required String challengeRequestId});
  Future<Option<Failure>> rejectChallengeRequest({required String challengeRequestId});
}
