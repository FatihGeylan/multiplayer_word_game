// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;
  Option<ValueFailure> get userNameFailure =>
      throw _privateConstructorUsedError;
  Option<ValueFailure> get passwordFailure =>
      throw _privateConstructorUsedError;
  ValidationErrorVisibility get validationErrorVisibility =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call(
      {bool isLoading,
      String userName,
      String password,
      Option<Failure> failure,
      Option<ValueFailure> userNameFailure,
      Option<ValueFailure> passwordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userName = null,
    Object? password = null,
    Object? failure = null,
    Object? userNameFailure = null,
    Object? passwordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      userNameFailure: null == userNameFailure
          ? _value.userNameFailure
          : userNameFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      passwordFailure: null == passwordFailure
          ? _value.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      validationErrorVisibility: null == validationErrorVisibility
          ? _value.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility {
    return $ValidationErrorVisibilityCopyWith<$Res>(
        _value.validationErrorVisibility, (value) {
      return _then(_value.copyWith(validationErrorVisibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupStateImplCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$SignupStateImplCopyWith(
          _$SignupStateImpl value, $Res Function(_$SignupStateImpl) then) =
      __$$SignupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String userName,
      String password,
      Option<Failure> failure,
      Option<ValueFailure> userNameFailure,
      Option<ValueFailure> passwordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  @override
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class __$$SignupStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupStateImpl>
    implements _$$SignupStateImplCopyWith<$Res> {
  __$$SignupStateImplCopyWithImpl(
      _$SignupStateImpl _value, $Res Function(_$SignupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userName = null,
    Object? password = null,
    Object? failure = null,
    Object? userNameFailure = null,
    Object? passwordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_$SignupStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      userNameFailure: null == userNameFailure
          ? _value.userNameFailure
          : userNameFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      passwordFailure: null == passwordFailure
          ? _value.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      validationErrorVisibility: null == validationErrorVisibility
          ? _value.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ));
  }
}

/// @nodoc

class _$SignupStateImpl extends _SignupState {
  _$SignupStateImpl(
      {required this.isLoading,
      required this.userName,
      required this.password,
      required this.failure,
      required this.userNameFailure,
      required this.passwordFailure,
      required this.validationErrorVisibility})
      : super._();

  @override
  final bool isLoading;
  @override
  final String userName;
  @override
  final String password;
  @override
  final Option<Failure> failure;
  @override
  final Option<ValueFailure> userNameFailure;
  @override
  final Option<ValueFailure> passwordFailure;
  @override
  final ValidationErrorVisibility validationErrorVisibility;

  @override
  String toString() {
    return 'SignupState(isLoading: $isLoading, userName: $userName, password: $password, failure: $failure, userNameFailure: $userNameFailure, passwordFailure: $passwordFailure, validationErrorVisibility: $validationErrorVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.userNameFailure, userNameFailure) ||
                other.userNameFailure == userNameFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.validationErrorVisibility,
                    validationErrorVisibility) ||
                other.validationErrorVisibility == validationErrorVisibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userName, password,
      failure, userNameFailure, passwordFailure, validationErrorVisibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      __$$SignupStateImplCopyWithImpl<_$SignupStateImpl>(this, _$identity);
}

abstract class _SignupState extends SignupState {
  factory _SignupState(
          {required final bool isLoading,
          required final String userName,
          required final String password,
          required final Option<Failure> failure,
          required final Option<ValueFailure> userNameFailure,
          required final Option<ValueFailure> passwordFailure,
          required final ValidationErrorVisibility validationErrorVisibility}) =
      _$SignupStateImpl;
  _SignupState._() : super._();

  @override
  bool get isLoading;
  @override
  String get userName;
  @override
  String get password;
  @override
  Option<Failure> get failure;
  @override
  Option<ValueFailure> get userNameFailure;
  @override
  Option<ValueFailure> get passwordFailure;
  @override
  ValidationErrorVisibility get validationErrorVisibility;
  @override
  @JsonKey(ignore: true)
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
