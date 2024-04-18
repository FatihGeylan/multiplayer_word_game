import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/custom/custom_dialog.dart';
import 'package:word_game/features/auth/presentation/providers/signup_provider.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../router/router.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signupProvider.select((value) => value.isLoading), (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Form(
            key: ref.watch(_keyProvider),
            autovalidateMode: ref.watch(signupProvider).validationErrorVisibility.when(
                  hide: () => AutovalidateMode.disabled,
                  show: () => AutovalidateMode.onUserInteraction,
                ),
            child: Column(
              children: [
                Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: darkBlue,
                      width: 8.r,
                    ),
                  ),
                  child: Center(
                    child: Text('W', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 48.sp)),
                  ),
                ),
                SizedBox(height: 52.h),
                Text(
                  'Kayıt Ol',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkBlue, fontSize: 24.sp),
                ),
                SizedBox(height: 32.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Kullanıcı Adı', style: Theme.of(context).textTheme.bodyMedium),
                ),
                SizedBox(height: 4.h),
                const _UserName(),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Şifre', style: Theme.of(context).textTheme.bodyMedium),
                ),
                SizedBox(height: 4.h),
                const _Password(),
                SizedBox(height: 50.h),
                const _SignupButton(),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    context.router.replace(const LoginRoute());
                  },
                  child: const Text('Hesabınız var mı? Giriş Yapın'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignupButton extends ConsumerWidget {
  const _SignupButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        final formState = ref.read(_keyProvider).currentState;

        final notifier = ref.read(signupProvider.notifier);

        formState
          ?..save()
          ..validate();

        notifier.showValidationErrors();

        if (ref.read(signupProvider).isValid && (formState?.validate() ?? false)) {
          await notifier.signUp();

          ref.read(signupProvider).failure.fold(
                () => context.router.replace(const LoginRoute()),
                (t) => CustomDialog.failure(
                  title: 'Hata',
                  subtitle: t.message,
                ).show(context),
              );
        }
      },
      child: const Text('Kayıt Ol'),
    );
  }
}

class _UserName extends ConsumerWidget {
  const _UserName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    return TextFormField(
      initialValue: ref.watch(signupProvider).userName,
      textInputAction: TextInputAction.next,
      onChanged: notifier.onUserNameChanged,
      onFieldSubmitted: notifier.onUserNameChanged,
      onSaved: notifier.onUserNameChanged,
      validator: (value) => ref.watch(signupProvider).userNameFailure.toNullable()?.message,
      decoration: const InputDecoration(
        hintText: 'Kullanıcı Adı Giriniz.',
      ),
    );
  }
}

class _Password extends ConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    return TextFormField(
      initialValue: ref.watch(signupProvider).password,
      textInputAction: TextInputAction.next,
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
      validator: (value) => ref.watch(signupProvider).passwordFailure.toNullable()?.message,
      decoration: const InputDecoration(
        hintText: 'Şifre Giriniz.',
      ),
    );
  }
}
