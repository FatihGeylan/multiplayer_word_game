// ignore_for_file: avoid_print, prefer_final_locals

import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:signalr_client_core/signalr_client.dart';
import 'package:word_game/constants/word_list.dart';
import 'package:word_game/features/home/domain/models/game_result.dart';
import 'package:word_game/features/home/presentation/pages/ingame_page.dart';
import 'package:word_game/features/home/presentation/states/ingame/ingame_state.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../core/injections/locator.dart';
import '../../../../utils/validators.dart';
import '../../domain/models/challenge.dart';
import '../../domain/models/letter.dart';
import '../../domain/models/pregame_info.dart';

final ingameProvider = NotifierProvider<_IngameNotifier, IngameState>(
  _IngameNotifier.new,
  dependencies: [wordLengthProvider, gameIdProvider],
);

final class _IngameNotifier extends Notifier<IngameState> {
  late final HubConnection hubConnection;
  late final Timer inactivityTimer;
  late final Timer hurryTimer;

  @override
  IngameState build() {
    Future(() => _init());

    ref.onDispose(() {
      log('Ingame dispose');
      hubConnection.stop();
      // inactivityTimer.cancel();
      // hurryTimer.cancel();
    });

    return IngameState.initial(
      wordLength: ref.read(wordLengthProvider),
      gameId: ref.read(gameIdProvider),
    );
  }

  Future<void> _init() async {
    final accessToken = (await ref.read(localeResourcesServiceProvider).getAccessToken()).getOrElse(() => '');

    hubConnection = HubConnectionBuilder()
        .withUrl(
          '${Endpoints.socketIngame}?access_token=$accessToken&game_id=${state.gameId}',
        )
        .build();

    await _startHubConnection();

    inactivityTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        state = state.copyWith(inactivityTime: state.inactivityTime + 1);
      },
    );

    hubConnection.on(
      'gameResult',
      (arguments) {
        log('GAME RESULT: $arguments');

        final res = arguments!.firstOrNull! as Map<String, dynamic>;

        final gameResult = GameResult.fromJson(res);

        state = state.copyWith(gameResult: some(gameResult));

        inactivityTimer.cancel();
        hurryTimer.cancel();

        // final gameResult = res["gameResultTypeId"] as int;

        // state = state.copyWith(gameResult: fromGameResultTypeId(gameResult));

        // log('GAME RESULT ON STATE: ${state.gameResult}');
      },
    );

    hubConnection.on(
      'currentGameStatus',
      (arguments) {
        log('GAME STATUS: $arguments');

        final myLetters = getNewLetterList(arguments, isOpponent: false);
        final opponentLetters = getNewLetterList(arguments, isOpponent: true);

        state = state.copyWith(
          myLetters: myLetters,
          opponentLetters: opponentLetters,
        );

        log('MY LETTERS: $myLetters');
        log('OPPONENT LETTERS: $opponentLetters');
      },
    );

    hubConnection.on(
      'challengeReceived',
      (arguments) {
        log('CHALLENGE RECEIVED: $arguments');
        final challenge = arguments?.firstOrNull as Map<String, dynamic>? ?? {};
        state = state.copyWith(
          rematchRequest: some(Challenge.fromJson(challenge)),
        );
      },
    );

    hubConnection.on(
      'rematchResult',
      (arguments) {
        state = state.copyWith(pregameInfo: none());
        log('REMATCH RESULT: $arguments');
        final res = arguments?.firstOrNull as Map<String, dynamic>? ?? {};

        if (res['isAccepted'] == true) {
          state =
              state.copyWith(pregameInfo: some(PregameInfo.fromJson(res['preGameInfoDto'] as Map<String, dynamic>)));
        } else {
          state = state.copyWith(isRematchRejected: true);
        }
        log('PREGAME ON STATE: ${state.pregameInfo}');
      },
    );

    state = state.copyWith(isLoading: false);
  }

  List<List<Letter>> getNewLetterList(List<Object?>? arguments, {required bool isOpponent}) {
    final res = arguments!.firstOrNull! as Map<String, dynamic>;

    final userGuesses = res[isOpponent ? "otherUserGuesses" : "currentUserGuesses"] as Map<String, dynamic>;

    final wordGuess = userGuesses["wordGuess"] as List;

    final List<List<Letter>> letters = wordGuess.map((e) {
      return (e as List).map((e2) {
        return Letter.fromJson(e2 as Map<String, dynamic>);
      }).toList();
    }).toList();

    if (isOpponent && letters.length == 5 && !state.isEnemyFinished) {
      state = state.copyWith(isEnemyFinished: true);
      hurryUp();
    }

    List<List<Letter>> newLetters = List.from(letters);

    //below code is to create a new list starts with newLetters and fill the rest with baseLetters.
    if (newLetters.length < state.baseLetters.length) {
      for (int i = newLetters.length; i < state.baseLetters.length; i++) {
        newLetters.add(
          List.generate(
            state.wordLength,
            (index) => isOpponent ? state.opponentLetters[i][index] : state.myLetters[i][index],
          ),
        );
      }
    }
    return newLetters;
  }

  Future<void> _startHubConnection() async {
    try {
      await hubConnection.start();
      print('INGAME HUB CONNECTED.');
    } catch (e) {
      print('Error starting SignalR connection: $e');
    }
  }

  void submit() {
    state = state.copyWith(
      wordFailure:
          validateWord(state.letters.elementAt(state.columnIndex).map((e) => e.letter!).join(), state.wordLength),
    );
  }

  void insertLetter(Letter letter) {
    if (state.rowIndex == state.wordLength) return;

    final newLetters = state.letters.mapWithIndex((t, index) {
      if (index == state.columnIndex) {
        return t.mapWithIndex((t, index) => index == state.rowIndex ? letter : t).toList();
      }
      return t;
    }).toList();

    state = state.copyWith(
      myLetters: newLetters,
      rowIndex: state.rowIndex + 1,
    );
  }

  void deleteLetter() {
    if (state.rowIndex == 0) return;

    final newLetters = state.letters.mapWithIndex((t, index) {
      if (index == state.columnIndex) {
        return t.mapWithIndex((t, index) => index == state.rowIndex - 1 ? const Letter("", 0) : t).toList();
      }
      return t;
    }).toList();

    state = state.copyWith(
      myLetters: newLetters,
      rowIndex: state.rowIndex - 1,
    );
  }

  void sendMessage(String message) {
    // Send the message to the SignalR hub
    try {
      hubConnection.invoke('guessWord', args: [message]);
      if (message != "-1") {
        state = state.copyWith(
          rowIndex: 0,
          columnIndex: state.columnIndex + 1,
        );
        resetInactivityTimer();
        if (state.isEnemyFinished && state.myLetters[state.columnIndex].every((element) => element.letter == "")) {
          state = state.copyWith(hurryTime: 10);
        }
      }
      log('Message sent: $message');
    } catch (e) {
      log('Error sending message: $e');
    }
  }

  void sendRematchRequest() {
    try {
      hubConnection.invoke('sendRematch', args: []);
      state = state.copyWith(isRematchSent: true);
      log('Rematch request sent');
    } catch (e) {
      log('Error sending message: $e');
    }
  }

  void acceptRequest() {
    try {
      hubConnection.invoke('acceptRematch', args: [state.rematchRequest.toNullable()!.id]);
      log('Rematch accepted');
    } catch (e) {
      log('Error accepting: $e');
    }
  }

  void rejectRequest() {
    try {
      hubConnection.invoke('rejectRematch', args: [state.rematchRequest.toNullable()!.id]);
      log('Rematch rejected');
    } catch (e) {
      log('Error rejecting: $e');
    }
  }

  void resetInactivityTimer() {
    state = state.copyWith(inactivityTime: 0);
  }

  void hurryUp() {
    state = state.copyWith(hurryTime: 10);
    hurryTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        state = state.copyWith(hurryTime: state.hurryTime - 1);
        if (state.hurryTime == 0 && state.myLetters[4].any((element) => element.letter == "")) {
          final filteredWords = wordList.where((element) => element.length == state.wordLength).toList();
          sendMessage(filteredWords[Random().nextInt(filteredWords.length)].replaceAll("i", "İ").toUpperCase());

          state = state.copyWith(hurryTime: 10);
        }
      },
    );
  }

  void toggleIsCheckingOpponent() {
    state = state.copyWith(isCheckingOpponent: !state.isCheckingOpponent);
  }
}
