import 'package:equatable/equatable.dart';

class Letter extends Equatable {
  final String? letter;
  final int code;

  const Letter(this.letter, this.code);

  factory Letter.fromJson(Map<String, dynamic> json) {
    return Letter(
      json['character'] as String?,
      json['positionColor'] as int,
    );
  }

  @override
  List<Object?> get props => [letter, code];
}
