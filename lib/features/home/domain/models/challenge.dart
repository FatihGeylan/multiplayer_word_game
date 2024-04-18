import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String id;
  final String senderUserId;
  final String senderUserName;
  final String receiverUserId;
  final String receiverUserName;
  final int challengeStatusId;
  final String? challengeRequestStatusName;

  const Challenge({
    required this.id,
    required this.senderUserId,
    required this.senderUserName,
    required this.receiverUserId,
    required this.receiverUserName,
    required this.challengeStatusId,
    required this.challengeRequestStatusName,
  });

  @override
  List<Object?> get props => [
        id,
        senderUserId,
        senderUserName,
        receiverUserId,
        receiverUserName,
        challengeStatusId,
        challengeRequestStatusName,
      ];

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String,
      senderUserId: json['senderUserId'] as String,
      senderUserName: json['senderUserName'] as String,
      receiverUserId: json['receiverUserId'] as String,
      receiverUserName: json['receiverUserName'] as String,
      challengeStatusId: json['challengeStatusId'] as int,
      challengeRequestStatusName: json['challengeRequestStatusName'] as String?,
    );
  }
}
