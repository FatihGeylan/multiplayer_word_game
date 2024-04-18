import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String userName;
  final int userStatusTypeId;
  final String userStatusTypeName;

  const User({
    required this.userId,
    required this.userName,
    required this.userStatusTypeId,
    required this.userStatusTypeName,
  });

  @override
  List<Object?> get props => [userId, userName, userStatusTypeId, userStatusTypeName];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userStatusTypeId: json['userStatusTypeId'] as int,
      userStatusTypeName: json['userStatusTypeName'] as String,
    );
  }
}
