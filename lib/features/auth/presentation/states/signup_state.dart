import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../core/models/value_failure/value_failure.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    required bool isLoading,
    required String userName,
    required String password,
    required Option<Failure> failure,
    required Option<ValueFailure> userNameFailure,
    required Option<ValueFailure> passwordFailure,
    required ValidationErrorVisibility validationErrorVisibility,
  }) = _SignupState;

  factory SignupState.initial() => SignupState(
        isLoading: false,
        userName: "",
        password: "",
        failure: none(),
        userNameFailure: none(),
        passwordFailure: none(),
        validationErrorVisibility: const ValidationErrorVisibility.hide(),
      );

  const SignupState._();

  bool get isValid => userNameFailure.isNone() && passwordFailure.isNone();
}
