import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/constants/locales.dart';

import 'constants/constans.dart';
import 'constants/sizes.dart';
import 'core/injections/locator.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) => GestureDetector(
        onTap: () => unfocus(context),
        child: const _MaterialApp(),
      ),
    );
  }

  void unfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class _MaterialApp extends ConsumerStatefulWidget {
  const _MaterialApp();

  @override
  ConsumerState<_MaterialApp> createState() => __MaterialAppState();
}

class __MaterialAppState extends ConsumerState<_MaterialApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      debugShowCheckedModeBanner: false,
      locale: trLocale,
      title: appName,
      theme: theme,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling, boldText: false),
        child: child!,
      ),
    );
  }
}
