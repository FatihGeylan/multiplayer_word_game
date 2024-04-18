// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActiveUsersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<User> get activeUsers => throw _privateConstructorUsedError;
  Lobby get lobby => throw _privateConstructorUsedError;
  Option<Failure> get sendRequestFailure => throw _privateConstructorUsedError;
  Option<Challenge> get receivedChallenge => throw _privateConstructorUsedError;
  Option<PregameInfo> get pregameInfo => throw _privateConstructorUsedError;
  bool get res => throw _privateConstructorUsedError;
  bool get isSentDialogOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveUsersStateCopyWith<ActiveUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveUsersStateCopyWith<$Res> {
  factory $ActiveUsersStateCopyWith(
          ActiveUsersState value, $Res Function(ActiveUsersState) then) =
      _$ActiveUsersStateCopyWithImpl<$Res, ActiveUsersState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<User> activeUsers,
      Lobby lobby,
      Option<Failure> sendRequestFailure,
      Option<Challenge> receivedChallenge,
      Option<PregameInfo> pregameInfo,
      bool res,
      bool isSentDialogOpen});
}

/// @nodoc
class _$ActiveUsersStateCopyWithImpl<$Res, $Val extends ActiveUsersState>
    implements $ActiveUsersStateCopyWith<$Res> {
  _$ActiveUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? activeUsers = null,
    Object? lobby = null,
    Object? sendRequestFailure = null,
    Object? receivedChallenge = null,
    Object? pregameInfo = null,
    Object? res = null,
    Object? isSentDialogOpen = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      activeUsers: null == activeUsers
          ? _value.activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      lobby: null == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby,
      sendRequestFailure: null == sendRequestFailure
          ? _value.sendRequestFailure
          : sendRequestFailure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      receivedChallenge: null == receivedChallenge
          ? _value.receivedChallenge
          : receivedChallenge // ignore: cast_nullable_to_non_nullable
              as Option<Challenge>,
      pregameInfo: null == pregameInfo
          ? _value.pregameInfo
          : pregameInfo // ignore: cast_nullable_to_non_nullable
              as Option<PregameInfo>,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as bool,
      isSentDialogOpen: null == isSentDialogOpen
          ? _value.isSentDialogOpen
          : isSentDialogOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveUsersStateImplCopyWith<$Res>
    implements $ActiveUsersStateCopyWith<$Res> {
  factory _$$ActiveUsersStateImplCopyWith(_$ActiveUsersStateImpl value,
          $Res Function(_$ActiveUsersStateImpl) then) =
      __$$ActiveUsersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<User> activeUsers,
      Lobby lobby,
      Option<Failure> sendRequestFailure,
      Option<Challenge> receivedChallenge,
      Option<PregameInfo> pregameInfo,
      bool res,
      bool isSentDialogOpen});
}

/// @nodoc
class __$$ActiveUsersStateImplCopyWithImpl<$Res>
    extends _$ActiveUsersStateCopyWithImpl<$Res, _$ActiveUsersStateImpl>
    implements _$$ActiveUsersStateImplCopyWith<$Res> {
  __$$ActiveUsersStateImplCopyWithImpl(_$ActiveUsersStateImpl _value,
      $Res Function(_$ActiveUsersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? activeUsers = null,
    Object? lobby = null,
    Object? sendRequestFailure = null,
    Object? receivedChallenge = null,
    Object? pregameInfo = null,
    Object? res = null,
    Object? isSentDialogOpen = null,
  }) {
    return _then(_$ActiveUsersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      activeUsers: null == activeUsers
          ? _value._activeUsers
          : activeUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      lobby: null == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby,
      sendRequestFailure: null == sendRequestFailure
          ? _value.sendRequestFailure
          : sendRequestFailure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      receivedChallenge: null == receivedChallenge
          ? _value.receivedChallenge
          : receivedChallenge // ignore: cast_nullable_to_non_nullable
              as Option<Challenge>,
      pregameInfo: null == pregameInfo
          ? _value.pregameInfo
          : pregameInfo // ignore: cast_nullable_to_non_nullable
              as Option<PregameInfo>,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as bool,
      isSentDialogOpen: null == isSentDialogOpen
          ? _value.isSentDialogOpen
          : isSentDialogOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ActiveUsersStateImpl implements _ActiveUsersState {
  _$ActiveUsersStateImpl(
      {required this.isLoading,
      required final List<User> activeUsers,
      required this.lobby,
      required this.sendRequestFailure,
      required this.receivedChallenge,
      required this.pregameInfo,
      required this.res,
      required this.isSentDialogOpen})
      : _activeUsers = activeUsers;

  @override
  final bool isLoading;
  final List<User> _activeUsers;
  @override
  List<User> get activeUsers {
    if (_activeUsers is EqualUnmodifiableListView) return _activeUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeUsers);
  }

  @override
  final Lobby lobby;
  @override
  final Option<Failure> sendRequestFailure;
  @override
  final Option<Challenge> receivedChallenge;
  @override
  final Option<PregameInfo> pregameInfo;
  @override
  final bool res;
  @override
  final bool isSentDialogOpen;

  @override
  String toString() {
    return 'ActiveUsersState(isLoading: $isLoading, activeUsers: $activeUsers, lobby: $lobby, sendRequestFailure: $sendRequestFailure, receivedChallenge: $receivedChallenge, pregameInfo: $pregameInfo, res: $res, isSentDialogOpen: $isSentDialogOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveUsersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._activeUsers, _activeUsers) &&
            (identical(other.lobby, lobby) || other.lobby == lobby) &&
            (identical(other.sendRequestFailure, sendRequestFailure) ||
                other.sendRequestFailure == sendRequestFailure) &&
            (identical(other.receivedChallenge, receivedChallenge) ||
                other.receivedChallenge == receivedChallenge) &&
            (identical(other.pregameInfo, pregameInfo) ||
                other.pregameInfo == pregameInfo) &&
            (identical(other.res, res) || other.res == res) &&
            (identical(other.isSentDialogOpen, isSentDialogOpen) ||
                other.isSentDialogOpen == isSentDialogOpen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_activeUsers),
      lobby,
      sendRequestFailure,
      receivedChallenge,
      pregameInfo,
      res,
      isSentDialogOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveUsersStateImplCopyWith<_$ActiveUsersStateImpl> get copyWith =>
      __$$ActiveUsersStateImplCopyWithImpl<_$ActiveUsersStateImpl>(
          this, _$identity);
}

abstract class _ActiveUsersState implements ActiveUsersState {
  factory _ActiveUsersState(
      {required final bool isLoading,
      required final List<User> activeUsers,
      required final Lobby lobby,
      required final Option<Failure> sendRequestFailure,
      required final Option<Challenge> receivedChallenge,
      required final Option<PregameInfo> pregameInfo,
      required final bool res,
      required final bool isSentDialogOpen}) = _$ActiveUsersStateImpl;

  @override
  bool get isLoading;
  @override
  List<User> get activeUsers;
  @override
  Lobby get lobby;
  @override
  Option<Failure> get sendRequestFailure;
  @override
  Option<Challenge> get receivedChallenge;
  @override
  Option<PregameInfo> get pregameInfo;
  @override
  bool get res;
  @override
  bool get isSentDialogOpen;
  @override
  @JsonKey(ignore: true)
  _$$ActiveUsersStateImplCopyWith<_$ActiveUsersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
