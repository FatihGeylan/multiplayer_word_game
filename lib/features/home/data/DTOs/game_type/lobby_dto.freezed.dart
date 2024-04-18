// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LobbyDto _$LobbyDtoFromJson(Map<String, dynamic> json) {
  return _LobbyDto.fromJson(json);
}

/// @nodoc
mixin _$LobbyDto {
  int get id => throw _privateConstructorUsedError;
  int get gameTypeId => throw _privateConstructorUsedError;
  String get gameTypeName => throw _privateConstructorUsedError;
  int get wordLength => throw _privateConstructorUsedError;
  int get totalUserCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyDtoCopyWith<LobbyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyDtoCopyWith<$Res> {
  factory $LobbyDtoCopyWith(LobbyDto value, $Res Function(LobbyDto) then) =
      _$LobbyDtoCopyWithImpl<$Res, LobbyDto>;
  @useResult
  $Res call(
      {int id,
      int gameTypeId,
      String gameTypeName,
      int wordLength,
      int totalUserCount});
}

/// @nodoc
class _$LobbyDtoCopyWithImpl<$Res, $Val extends LobbyDto>
    implements $LobbyDtoCopyWith<$Res> {
  _$LobbyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameTypeId = null,
    Object? gameTypeName = null,
    Object? wordLength = null,
    Object? totalUserCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameTypeId: null == gameTypeId
          ? _value.gameTypeId
          : gameTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gameTypeName: null == gameTypeName
          ? _value.gameTypeName
          : gameTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      wordLength: null == wordLength
          ? _value.wordLength
          : wordLength // ignore: cast_nullable_to_non_nullable
              as int,
      totalUserCount: null == totalUserCount
          ? _value.totalUserCount
          : totalUserCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LobbyDtoImplCopyWith<$Res>
    implements $LobbyDtoCopyWith<$Res> {
  factory _$$LobbyDtoImplCopyWith(
          _$LobbyDtoImpl value, $Res Function(_$LobbyDtoImpl) then) =
      __$$LobbyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int gameTypeId,
      String gameTypeName,
      int wordLength,
      int totalUserCount});
}

/// @nodoc
class __$$LobbyDtoImplCopyWithImpl<$Res>
    extends _$LobbyDtoCopyWithImpl<$Res, _$LobbyDtoImpl>
    implements _$$LobbyDtoImplCopyWith<$Res> {
  __$$LobbyDtoImplCopyWithImpl(
      _$LobbyDtoImpl _value, $Res Function(_$LobbyDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameTypeId = null,
    Object? gameTypeName = null,
    Object? wordLength = null,
    Object? totalUserCount = null,
  }) {
    return _then(_$LobbyDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameTypeId: null == gameTypeId
          ? _value.gameTypeId
          : gameTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gameTypeName: null == gameTypeName
          ? _value.gameTypeName
          : gameTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      wordLength: null == wordLength
          ? _value.wordLength
          : wordLength // ignore: cast_nullable_to_non_nullable
              as int,
      totalUserCount: null == totalUserCount
          ? _value.totalUserCount
          : totalUserCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LobbyDtoImpl extends _LobbyDto {
  const _$LobbyDtoImpl(
      {required this.id,
      required this.gameTypeId,
      required this.gameTypeName,
      required this.wordLength,
      required this.totalUserCount})
      : super._();

  factory _$LobbyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LobbyDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int gameTypeId;
  @override
  final String gameTypeName;
  @override
  final int wordLength;
  @override
  final int totalUserCount;

  @override
  String toString() {
    return 'LobbyDto(id: $id, gameTypeId: $gameTypeId, gameTypeName: $gameTypeName, wordLength: $wordLength, totalUserCount: $totalUserCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LobbyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameTypeId, gameTypeId) ||
                other.gameTypeId == gameTypeId) &&
            (identical(other.gameTypeName, gameTypeName) ||
                other.gameTypeName == gameTypeName) &&
            (identical(other.wordLength, wordLength) ||
                other.wordLength == wordLength) &&
            (identical(other.totalUserCount, totalUserCount) ||
                other.totalUserCount == totalUserCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, gameTypeId, gameTypeName, wordLength, totalUserCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbyDtoImplCopyWith<_$LobbyDtoImpl> get copyWith =>
      __$$LobbyDtoImplCopyWithImpl<_$LobbyDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LobbyDtoImplToJson(
      this,
    );
  }
}

abstract class _LobbyDto extends LobbyDto {
  const factory _LobbyDto(
      {required final int id,
      required final int gameTypeId,
      required final String gameTypeName,
      required final int wordLength,
      required final int totalUserCount}) = _$LobbyDtoImpl;
  const _LobbyDto._() : super._();

  factory _LobbyDto.fromJson(Map<String, dynamic> json) =
      _$LobbyDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get gameTypeId;
  @override
  String get gameTypeName;
  @override
  int get wordLength;
  @override
  int get totalUserCount;
  @override
  @JsonKey(ignore: true)
  _$$LobbyDtoImplCopyWith<_$LobbyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
