import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/features/home/domain/models/game_result_enum.dart';
import 'package:word_game/features/home/domain/models/pregame_info.dart';

import '../../../../../constants/constans.dart';
import '../../../../../core/models/value_failure/value_failure.dart';
import '../../../domain/models/letter.dart';

part 'pregame_state.freezed.dart';

@freezed
class PregameState with _$PregameState {
  factory PregameState({
    required bool isLoading,
    required String code,
    required Option<ValueFailure> codeFailure,
    required PregameInfo pregameInfo,
    required GameResultEnum gameResult,
    required bool wordSent,
    required List<Letter> letters,
    required int index,
    required int? filledIndex,
    required Option<String> gameId,
  }) = _PregameState;

  factory PregameState.initial({required PregameInfo pregameInfo}) {
    final i = pregameInfo.gameTypeId == 1 ? null : Random().nextInt(pregameInfo.wordLength);

    var x = turkishCapitalAlphabet.characters.elementAt(Random().nextInt(turkishCapitalAlphabet.characters.length));
    if (i == 0 && x == 'Ğ') x = 'G';

    return PregameState(
      isLoading: false,
      code: '',
      codeFailure: none(),
      pregameInfo: pregameInfo,
      gameResult: GameResultEnum.ongoing,
      wordSent: false,
      letters: List.generate(
        pregameInfo.wordLength,
        (index) => Letter(index == i ? x : "", 0),
      ),
      index: 0,
      filledIndex: i,
      gameId: none(),
    );
  }
}
