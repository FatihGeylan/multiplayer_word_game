import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/features/home/domain/models/lobby.dart';

part 'lobby_dto.freezed.dart';
part 'lobby_dto.g.dart';

@freezed
class LobbyDto with _$LobbyDto {
  const factory LobbyDto({
    required int id,
    required int gameTypeId,
    required String gameTypeName,
    required int wordLength,
    required int totalUserCount,
  }) = _LobbyDto;

  factory LobbyDto.fromJson(Map<String, dynamic> json) => _$LobbyDtoFromJson(json);

  const LobbyDto._();

  Lobby toDomain() {
    return Lobby(
      id: id,
      gameTypeId: gameTypeId,
      gameTypeName: gameTypeName,
      wordLength: wordLength,
      totalUserCount: totalUserCount,
    );
  }
}
