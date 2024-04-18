import 'package:fpdart/fpdart.dart';
import 'package:word_game/core/models/failure/failure.dart';

abstract interface class AuthRepository {
  Future<bool> isTokenExpired();
  Future<Option<Failure>> login({
    required String username,
    required String password,
  });
  Future<Option<Failure>> signUp({
    required String username,
    required String password,
  });
}
