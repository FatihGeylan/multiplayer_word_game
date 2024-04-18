// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobby_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LobbyDtoImpl _$$LobbyDtoImplFromJson(Map<String, dynamic> json) =>
    _$LobbyDtoImpl(
      id: json['id'] as int,
      gameTypeId: json['gameTypeId'] as int,
      gameTypeName: json['gameTypeName'] as String,
      wordLength: json['wordLength'] as int,
      totalUserCount: json['totalUserCount'] as int,
    );

Map<String, dynamic> _$$LobbyDtoImplToJson(_$LobbyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameTypeId': instance.gameTypeId,
      'gameTypeName': instance.gameTypeName,
      'wordLength': instance.wordLength,
      'totalUserCount': instance.totalUserCount,
    };
