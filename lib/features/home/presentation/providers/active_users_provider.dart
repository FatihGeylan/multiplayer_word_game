// ignore_for_file: avoid_dynamic_calls, avoid_print

import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:signalr_client_core/signalr_client.dart';
import 'package:word_game/core/injections/locator.dart';
import 'package:word_game/features/home/domain/models/challenge.dart';
import 'package:word_game/features/home/domain/models/pregame_info.dart';
import 'package:word_game/features/home/presentation/pages/active_users_page.dart';
import 'package:word_game/features/home/presentation/states/active_users/active_users_state.dart';

import '../../../../constants/api_endpoints.dart';
import '../../domain/models/user.dart';

final activeUsersProvider = NotifierProvider<_ActiveUsersNotifier, ActiveUsersState>(
  _ActiveUsersNotifier.new,
  dependencies: [selectedLobbyProvider],
);

final class _ActiveUsersNotifier extends Notifier<ActiveUsersState> {
  late final HubConnection hubConnection;
  // final hubConnection = HubConnectionBuilder()
  //     .withUrl(
  //       'https://346f-159-146-72-151.ngrok-free.app/signalr-hubs/lobby?access_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA1M0E5QTdDMDk2REJEMjAyQTIzRDYwOURBODMwQ0U1RjM5MEIwRUMiLCJ4NXQiOiJCVHFhZkFsdHZTQXFJOVlKMm9NTTVmT1FzT3ciLCJ0eXAiOiJhdCtqd3QifQ.eyJzdWIiOiIzYTExZWFmYi1hOTA0LWRiMTMtOGI1OC0xZjExMGI4NjI3YWEiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJVc2VyNSIsImVtYWlsIjoie1VzZXI1fUBhc2QuY29tIiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjoiRmFsc2UiLCJlbWFpbF92ZXJpZmllZCI6IkZhbHNlIiwidW5pcXVlX25hbWUiOiJVc2VyNSIsIm9pX3Byc3QiOiJXb3JkR2FtZV9BcHAiLCJjbGllbnRfaWQiOiJXb3JkR2FtZV9BcHAiLCJvaV90a25faWQiOiIzYTExZWJjYy1kNDc0LWYzYjUtNDcyMy01OGI1OGJiMmExYjQiLCJhdWQiOiJXb3JkR2FtZSIsInNjb3BlIjoiV29yZEdhbWUiLCJqdGkiOiI2NzA0NDQwYS0xNjliLTQ5NjEtYTYwYS1jNzNiMzRhYjAxM2QiLCJleHAiOjE3MTMwNTE3MjQsImlzcyI6Imh0dHBzOi8vMzQ2Zi0xNTktMTQ2LTcyLTE1MS5uZ3Jvay1mcmVlLmFwcC8iLCJpYXQiOjE3MTMwNDgxMjR9.uAqWgShQwGlAc-oD9CBiE56HbILTmUKGfXSj_lWMcrf_BdPc1Pxsgtxw7tdjNhOtRpJuyzeGlPqf0uTd0Jbf8jjve93iTD7tBOR6VPh83Jc9E5mtdxHMWN8d6gPpcJZ6qOokZJx7puRvYzi1re6MqSzUZeeeIbPIUe1e2C5Ia96ZA2JqAVSOo25wjrU4zYDcPgQHtpruEN3T9SXumWmRgRKVVYoaywT7znUA6wLstAahxgKTlGGYAzYMk0fwxjtzas5f4MEYHTFnrAhLeSK374FO4KVFgsUy90tZ9tZToRrQLHwVITJfEIrBDkdgjTTwlSpDVnILRYYoDIDcnpmNYA&channel_id=1',
  //     )
  //     .build();
  @override
  ActiveUsersState build() {
    ref.onDispose(() {
      hubConnection.stop();
    });

    Future(() => _init());

    return ActiveUsersState.initial(lobby: ref.read(selectedLobbyProvider));
  }

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);

    final accessToken = (await ref.read(localeResourcesServiceProvider).getAccessToken()).getOrElse(() => '');

    hubConnection = HubConnectionBuilder()
        .withUrl(
          '${Endpoints.socketLobby}?access_token=$accessToken&channel_id=${state.lobby.id}',
        )
        .build();

    await _startHubConnection();

    hubConnection.on(
      'activeUsers',
      (arguments) {
        state = state.copyWith(activeUsers: []);
        for (final element in (arguments?.firstOrNull as List?) ?? []) {
          state = state.copyWith(
            activeUsers: [...state.activeUsers, User.fromJson(element as Map<String, dynamic>)],
          );
        }
      },
    );

    hubConnection.on(
      'challengeReceived',
      (arguments) {
        log('CHALLENGE RECEIVED: $arguments');
        final challenge = arguments?.firstOrNull as Map<String, dynamic>? ?? {};
        state = state.copyWith(
          receivedChallenge: some(Challenge.fromJson(challenge)),
        );
        log('this is the challenge on state: ${state.receivedChallenge}');
      },
    );

    hubConnection.on(
      'challengeResult',
      (arguments) {
        state = state.copyWith(pregameInfo: none());
        log('CHALLENGE RESULT: $arguments');
        final res = arguments?.firstOrNull as Map<String, dynamic>? ?? {};

        if (res['isAccepted'] == true) {
          state =
              state.copyWith(pregameInfo: some(PregameInfo.fromJson(res['preGameInfoDto'] as Map<String, dynamic>)));
        }
        log('PREGAME ON STATE: ${state.pregameInfo}');
        state = state.copyWith(isLoading: false, res: true);
      },
    );

    state = state.copyWith(isLoading: false);
  }

  Future<void> _startHubConnection() async {
    try {
      await hubConnection.start();
      print('SignalR connection started.');
    } catch (e) {
      print('Error starting SignalR connection: $e');
    }
  }

  Future<void> sendChallengeRequest({required String userId}) async {
    state = state.copyWith(sendRequestFailure: none(), isLoading: true);

    final result = await ref.read(homeRepositoryProvider).sendChallengeRequest(userId: userId);

    state = state.copyWith(sendRequestFailure: result, isLoading: false, res: false);
  }

  Future<void> acceptChallengeRequest() async {
    state = state.copyWith(isLoading: true);

    await ref
        .read(homeRepositoryProvider)
        .acceptChallengeRequest(challengeRequestId: state.receivedChallenge.toNullable()!.id);

    state = state.copyWith(isLoading: false, receivedChallenge: none(), res: false);
  }

  Future<void> rejectChallengeRequest() async {
    state = state.copyWith(isLoading: true);

    await ref
        .read(homeRepositoryProvider)
        // .rejectChallengeRequest(challengeRequestId: "3a11f098-df83-d9c3-23f0-24defaa06f40");
        .rejectChallengeRequest(challengeRequestId: state.receivedChallenge.toNullable()!.id);

    state = state.copyWith(isLoading: false, receivedChallenge: none(), res: false);
  }

  void changeSentDialogState(bool val) {
    state = state.copyWith(isSentDialogOpen: val);
  }

  void changeRes(bool val) {
    state = state.copyWith(res: val);
  }
}
