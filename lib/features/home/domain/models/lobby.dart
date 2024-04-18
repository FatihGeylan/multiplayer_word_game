import 'package:equatable/equatable.dart';

class Lobby extends Equatable {
  final int id;
  final int gameTypeId;
  final String gameTypeName;
  final int wordLength;
  final int totalUserCount;

  const Lobby({
    required this.id,
    required this.gameTypeId,
    required this.gameTypeName,
    required this.wordLength,
    required this.totalUserCount,
  });

  @override
  List<Object?> get props => [id, gameTypeId, gameTypeName, wordLength, totalUserCount];
}
