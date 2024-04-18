import 'package:equatable/equatable.dart';

class PregameInfo extends Equatable {
  final String id;
  final String challengeRequestId;
  final int gameTypeId;
  final String gameTypeName;
  final int wordLength;

  const PregameInfo({
    required this.id,
    required this.challengeRequestId,
    required this.gameTypeId,
    required this.gameTypeName,
    required this.wordLength,
  });

  @override
  List<Object?> get props => [id, challengeRequestId, gameTypeId, gameTypeName, wordLength];

  factory PregameInfo.fromJson(Map<String, dynamic> json) {
    return PregameInfo(
      id: json['id'] as String,
      challengeRequestId: json['challengeRequestId'] as String,
      gameTypeId: json['gameTypeId'] as int,
      gameTypeName: json['gameTypeName'] as String,
      wordLength: json['wordLength'] as int,
    );
  }
}
