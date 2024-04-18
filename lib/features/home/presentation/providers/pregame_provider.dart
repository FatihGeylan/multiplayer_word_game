// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:signalr_client_core/signalr_client.dart';
import 'package:word_game/features/home/presentation/pages/pregame_page.dart';
import 'package:word_game/features/home/presentation/states/pregame/pregame_state.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../core/injections/locator.dart';
import '../../../../utils/validators.dart';
import '../../domain/models/game_result_enum.dart';
import '../../domain/models/letter.dart';

final pregameProvider = NotifierProvider<_PregameNotifier, PregameState>(
  _PregameNotifier.new,
  dependencies: [pregameInfoProvider, isRematchProvider],
);

final class _PregameNotifier extends Notifier<PregameState> {
  late final HubConnection hubConnection;

  @override
  PregameState build() {
    ref.onDispose(() {
      log('Pregame dispose');
      hubConnection.stop();
    });

    Future(() => _init());
    return PregameState.initial(pregameInfo: ref.read(pregameInfoProvider));
  }

  Future<void> _init() async {
    final accessToken = (await ref.read(localeResourcesServiceProvider).getAccessToken()).getOrElse(() => '');

    hubConnection = HubConnectionBuilder()
        .withUrl(
          '${Endpoints.socketPregame}?access_token=$accessToken&pre_game_info_id=${state.pregameInfo.id}&is_rematch=${ref.read(isRematchProvider)}',
        )
        .build();

    await _startHubConnection();

    hubConnection.on(
      'gameResult',
      (arguments) {
        log('GAME RESULT: $arguments');
        final res = arguments!.firstOrNull! as Map<String, dynamic>;
        final gameResult = res["gameResultTypeId"] as int;

        state = state.copyWith(gameResult: fromGameResultTypeId(gameResult));

        log('GAME RESULT ON STATE: ${state.gameResult}');
      },
    );

    hubConnection.on(
      'newGame',
      (arguments) {
        log('NEW GAME INFO: $arguments');
        final res = arguments!.firstOrNull! as Map<String, dynamic>;
        final gameId = res["gameId"] as String;

        state = state.copyWith(gameId: some(gameId));

        log('GAME ID ON STATE: ${state.gameId.toNullable()}');
      },
    );

    state = state.copyWith(isLoading: false);
  }

  Future<void> _startHubConnection() async {
    try {
      await hubConnection.start();
      print('PREGAME HUB CONNECTED.');
    } catch (e) {
      print('Error starting SignalR connection: $e');
    }
  }

  void submit() {
    state = state.copyWith(
      codeFailure: validateWord(state.letters.map((e) => e.letter!).join(), state.pregameInfo.wordLength),
    );
  }

  void insertLetter(Letter letter) {
    if (state.index == state.filledIndex) state = state.copyWith(index: state.index + 1);
    if (state.index == state.pregameInfo.wordLength) return;

    state = state.copyWith(
      letters: state.letters.mapWithIndex((t, index) => index == state.index ? letter : t).toList(),
      index: state.index + 1,
    );
  }

  void deleteLetter() {
    if (state.filledIndex != null && state.index == state.filledIndex! + 1) {
      state = state.copyWith(index: state.index - 1);
    }
    if (state.index == 0) return;
    state = state.copyWith(
      letters: state.letters.mapWithIndex((t, index) => index == state.index - 1 ? const Letter("", 0) : t).toList(),
      index: state.index - 1,
    );
  }

  void sendMessage(String message) {
    // Send the message to the SignalR hub
    try {
      hubConnection.invoke('setWord', args: [message]);
      if (message != "-1") {
        state = state.copyWith(wordSent: true);
      }
      log('Message sent: $message');
    } catch (e) {
      log('Error sending message: $e');
    }
  }
}
