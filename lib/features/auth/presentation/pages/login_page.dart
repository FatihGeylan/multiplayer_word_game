import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/custom_dialog.dart';
import '../../../../router/router.dart';
import '../providers/login_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider.select((value) => value.isLoading), (previous, next) {
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
            autovalidateMode: ref.watch(loginProvider).validationErrorVisibility.when(
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
                  'Hoşgeldiniz',
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
                const _LoginButton(),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    context.router.replace(const SignupRoute());
                  },
                  child: const Text('Hesabınız yok mu? Kayıt Olun'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserName extends ConsumerWidget {
  const _UserName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    return TextFormField(
      initialValue: ref.watch(loginProvider).userName,
      textInputAction: TextInputAction.next,
      onChanged: notifier.onUserNameChanged,
      onFieldSubmitted: notifier.onUserNameChanged,
      onSaved: notifier.onUserNameChanged,
      validator: (value) => ref.watch(loginProvider).userNameFailure.toNullable()?.message,
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
    final notifier = ref.watch(loginProvider.notifier);
    return TextFormField(
      initialValue: ref.watch(loginProvider).password,
      textInputAction: TextInputAction.next,
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
      validator: (value) => ref.read(loginProvider).passwordFailure.toNullable()?.message,
      decoration: const InputDecoration(
        hintText: 'Şifre Giriniz.',
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        final formState = ref.read(_keyProvider).currentState;

        final notifier = ref.read(loginProvider.notifier);

        formState
          ?..save()
          ..validate();

        notifier.showValidationErrors();

        if (ref.read(loginProvider).isValid && (formState?.validate() ?? false)) {
          await notifier.login();

          ref.read(loginProvider).failure.fold(
                () => context.router.replaceAll([const LobbiesRoute()]),
                (t) => CustomDialog.failure(
                  title: 'Hata',
                  subtitle: t.message,
                ).show(context),
              );
        }
      },
      child: const Text('Giriş Yap'),
    );
  }
}
