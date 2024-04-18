import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/features/auth/presentation/states/signup_state.dart';
import 'package:word_game/utils/validators.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';

final signupProvider = NotifierProvider.autoDispose<_SignupNotifier, SignupState>(_SignupNotifier.new);

class _SignupNotifier extends AutoDisposeNotifier<SignupState> {
  @override
  SignupState build() => SignupState.initial();

  Future<void> signUp() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(authRepositoryProvider).signUp(
          username: state.userName,
          password: state.password,
        );

    state = state.copyWith(failure: result, isLoading: false);
  }

  void onUserNameChanged(String? value) {
    state = state.copyWith(
      userName: value ?? "",
      userNameFailure: validateUserName(value ?? ""),
    );
  }

  void onPasswordChanged(String? value) {
    state = state.copyWith(
      password: value ?? "",
      passwordFailure: validatePassword(value ?? ""),
    );
  }

  void showValidationErrors() {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());
  }
}
