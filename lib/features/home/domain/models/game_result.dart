class GameResult {
  final String gameId;
  final int gameResultId;
  final String gameResultName;
  final UserScore? currentUserScore;
  final UserScore? otherUserScore;
  final GameResult? previousGameResult;

  GameResult({
    required this.gameId,
    required this.gameResultId,
    required this.gameResultName,
    this.currentUserScore,
    this.otherUserScore,
    this.previousGameResult,
  });

  factory GameResult.fromJson(Map<String, dynamic> json) {
    return GameResult(
      gameId: json['gameId'] as String,
      gameResultId: json['gameResultId'] as int,
      gameResultName: json['gameResultName'] as String,
      currentUserScore: json['currentUserScore'] == null
          ? null
          : UserScore.fromJson(json['currentUserScore'] as Map<String, dynamic>?),
      otherUserScore:
          json['otherUserScore'] == null ? null : UserScore.fromJson(json['otherUserScore'] as Map<String, dynamic>?),
      previousGameResult: json['previousGameResult'] == null
          ? null
          : GameResult.fromJson(json['previousGameResult'] as Map<String, dynamic>),
    );
  }
}

class UserScore {
  final int totalScore;
  final int greenCharacterScore;
  final int yellowCharacterScore;
  final int pregameRemainingTimeScore;
  final int elapsedTimeSeconds;

  UserScore({
    required this.totalScore,
    required this.greenCharacterScore,
    required this.yellowCharacterScore,
    required this.pregameRemainingTimeScore,
    required this.elapsedTimeSeconds,
  });

  factory UserScore.fromJson(Map<String, dynamic>? json) {
    return UserScore(
      totalScore: json?['totalScore'] as int,
      greenCharacterScore: json?['greenCharacterScore'] as int,
      yellowCharacterScore: json?['yellowCharacterScore'] as int,
      pregameRemainingTimeScore: json?['pregameRemainingTimeScore'] as int,
      elapsedTimeSeconds: json?['elapsedTimeSeconds'] as int,
    );
  }
}
