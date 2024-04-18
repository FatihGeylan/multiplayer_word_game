import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/features/home/domain/models/challenge.dart';
import 'package:word_game/features/home/domain/models/letter.dart';
import 'package:word_game/features/home/domain/models/pregame_info.dart';

import '../../../../../core/models/value_failure/value_failure.dart';
import '../../../domain/models/game_result.dart';

part 'ingame_state.freezed.dart';

@freezed
class IngameState with _$IngameState {
  factory IngameState({
    required bool isLoading,
    required String code,
    required List<List<Letter>> baseLetters,
    required List<List<Letter>> myLetters,
    required List<List<Letter>> opponentLetters,
    required Option<ValueFailure> wordFailure,
    required int rowIndex,
    required int columnIndex,
    required int wordLength,
    required String gameId,
    required bool isCheckingOpponent,
    required int inactivityTime,
    required int hurryTime,
    required bool isEnemyFinished,
    required Option<GameResult> gameResult,
    required Option<Challenge> rematchRequest,
    required Option<PregameInfo> pregameInfo,
    required bool isRematchRejected,
    required bool isRematchSent,
  }) = _IngameState;

  factory IngameState.initial({
    required int wordLength,
    required String gameId,
  }) {
    return IngameState(
      isLoading: false,
      code: '',
      baseLetters: List.generate(
        5,
        (index) => List.generate(wordLength, (index) => const Letter("", 0)),
      ),
      myLetters: List.generate(
        5,
        (index) => List.generate(wordLength, (index) => const Letter("", 0)),
      ),
      opponentLetters: List.generate(
        5,
        (index) => List.generate(wordLength, (index) => const Letter("", 0)),
      ),
      rowIndex: 0,
      columnIndex: 0,
      wordLength: wordLength,
      gameId: gameId,
      wordFailure: none(),
      isCheckingOpponent: false,
      inactivityTime: 0,
      hurryTime: 0,
      isEnemyFinished: false,
      gameResult: none(),
      rematchRequest: none(),
      pregameInfo: none(),
      isRematchRejected: false,
      isRematchSent: false,
    );
  }

  const IngameState._();

  List<List<Letter>> get letters => isCheckingOpponent ? opponentLetters : myLetters;
}
