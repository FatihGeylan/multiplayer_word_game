import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/system_ui_overlay_styles.dart';
import 'core/injections/locator.dart';
import 'utils/http_overrides.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      await configureDependencies();

      HttpOverrides.global = MyHttpOverrides();

      runApp(
        ProviderScope(
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
