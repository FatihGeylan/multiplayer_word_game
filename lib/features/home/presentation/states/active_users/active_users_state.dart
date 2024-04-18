import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/features/home/domain/models/pregame_info.dart';
import 'package:word_game/features/home/domain/models/user.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../domain/models/challenge.dart';
import '../../../domain/models/lobby.dart';

part 'active_users_state.freezed.dart';

@freezed
class ActiveUsersState with _$ActiveUsersState {
  factory ActiveUsersState({
    required bool isLoading,
    required List<User> activeUsers,
    required Lobby lobby,
    required Option<Failure> sendRequestFailure,
    required Option<Challenge> receivedChallenge,
    required Option<PregameInfo> pregameInfo,
    required bool res,
    required bool isSentDialogOpen,
  }) = _ActiveUsersState;

  factory ActiveUsersState.initial({required Lobby lobby}) => ActiveUsersState(
        isLoading: false,
        activeUsers: [],
        lobby: lobby,
        sendRequestFailure: none(),
        receivedChallenge: none(),
        pregameInfo: none(),
        res: false,
        isSentDialogOpen: false,
      );
}
