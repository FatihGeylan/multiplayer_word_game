import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/features/home/domain/models/lobby.dart';

import '../../../../../core/models/failure/failure.dart';

part 'lobbies_state.freezed.dart';

@freezed
class LobbiesState with _$LobbiesState {
  factory LobbiesState({
    required bool isLoading,
    required List<Lobby> lobbies,
    required Option<Failure> failure,
  }) = _LobbiesState;

  factory LobbiesState.initial() => LobbiesState(
        isLoading: false,
        lobbies: [],
        failure: none(),
      );
}
