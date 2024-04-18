// ignore_for_file: avoid_classes_with_only_static_members

abstract final class Endpoints {
  static const baseUrl = "https://348d-159-146-72-102.ngrok-free.app/";

  // static String getTaskDetail({required String id}) => "${baseUrlAuth}task-management/tasks/$id";

  static const login = "${baseUrl}api/account/basic-login";
  static const signUp = "${baseUrl}api/account/register";
  static const getLobbies = "${baseUrl}api/lobbies";
  static String sendChallengeRequest({required String userId}) => "${baseUrl}api/challenge-requests/send/$userId";

  static String acceptChallengeRequest({required String challengeRequestId}) =>
      "${baseUrl}api/challenge-requests/$challengeRequestId/accept";

  static String rejectChallengeRequest({required String challengeRequestId}) =>
      "${baseUrl}api/challenge-requests/$challengeRequestId/reject";

  // Web sockets
  static const socketLobby = "${baseUrl}signalr-hubs/lobby";
  static const socketPregame = "${baseUrl}signalr-hubs/pregame";
  static const socketIngame = "${baseUrl}signalr-hubs/game";
}
