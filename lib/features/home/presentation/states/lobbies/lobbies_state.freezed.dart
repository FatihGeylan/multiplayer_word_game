// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobbies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LobbiesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Lobby> get lobbies => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LobbiesStateCopyWith<LobbiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbiesStateCopyWith<$Res> {
  factory $LobbiesStateCopyWith(
          LobbiesState value, $Res Function(LobbiesState) then) =
      _$LobbiesStateCopyWithImpl<$Res, LobbiesState>;
  @useResult
  $Res call({bool isLoading, List<Lobby> lobbies, Option<Failure> failure});
}

/// @nodoc
class _$LobbiesStateCopyWithImpl<$Res, $Val extends LobbiesState>
    implements $LobbiesStateCopyWith<$Res> {
  _$LobbiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lobbies = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lobbies: null == lobbies
          ? _value.lobbies
          : lobbies // ignore: cast_nullable_to_non_nullable
              as List<Lobby>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LobbiesStateImplCopyWith<$Res>
    implements $LobbiesStateCopyWith<$Res> {
  factory _$$LobbiesStateImplCopyWith(
          _$LobbiesStateImpl value, $Res Function(_$LobbiesStateImpl) then) =
      __$$LobbiesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Lobby> lobbies, Option<Failure> failure});
}

/// @nodoc
class __$$LobbiesStateImplCopyWithImpl<$Res>
    extends _$LobbiesStateCopyWithImpl<$Res, _$LobbiesStateImpl>
    implements _$$LobbiesStateImplCopyWith<$Res> {
  __$$LobbiesStateImplCopyWithImpl(
      _$LobbiesStateImpl _value, $Res Function(_$LobbiesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lobbies = null,
    Object? failure = null,
  }) {
    return _then(_$LobbiesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lobbies: null == lobbies
          ? _value._lobbies
          : lobbies // ignore: cast_nullable_to_non_nullable
              as List<Lobby>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$LobbiesStateImpl implements _LobbiesState {
  _$LobbiesStateImpl(
      {required this.isLoading,
      required final List<Lobby> lobbies,
      required this.failure})
      : _lobbies = lobbies;

  @override
  final bool isLoading;
  final List<Lobby> _lobbies;
  @override
  List<Lobby> get lobbies {
    if (_lobbies is EqualUnmodifiableListView) return _lobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lobbies);
  }

  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'LobbiesState(isLoading: $isLoading, lobbies: $lobbies, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LobbiesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._lobbies, _lobbies) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_lobbies), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbiesStateImplCopyWith<_$LobbiesStateImpl> get copyWith =>
      __$$LobbiesStateImplCopyWithImpl<_$LobbiesStateImpl>(this, _$identity);
}

abstract class _LobbiesState implements LobbiesState {
  factory _LobbiesState(
      {required final bool isLoading,
      required final List<Lobby> lobbies,
      required final Option<Failure> failure}) = _$LobbiesStateImpl;

  @override
  bool get isLoading;
  @override
  List<Lobby> get lobbies;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$LobbiesStateImplCopyWith<_$LobbiesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
