// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActiveUsersRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveUsersRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: ActiveUsersPage(lobby: args.lobby)),
      );
    },
    GameResultRoute.name: (routeData) {
      final args = routeData.argsAs<GameResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameResultPage(
          gameResult: args.gameResult,
          myLetters: args.myLetters,
          opponentLetters: args.opponentLetters,
        ),
      );
    },
    GameWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<GameWrapperRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameWrapperPage(
          wordLength: args.wordLength,
          gameId: args.gameId,
        ),
      );
    },
    IngameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IngamePage(),
      );
    },
    LobbiesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LobbiesPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    },
    PregameRoute.name: (routeData) {
      final args = routeData.argsAs<PregameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PregamePage(
          pregameInfo: args.pregameInfo,
          isSender: args.isSender,
          isRematch: args.isRematch,
        )),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupPage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(
          resetToken: args.resetToken,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [ActiveUsersPage]
class ActiveUsersRoute extends PageRouteInfo<ActiveUsersRouteArgs> {
  ActiveUsersRoute({
    required Lobby lobby,
    List<PageRouteInfo>? children,
  }) : super(
          ActiveUsersRoute.name,
          args: ActiveUsersRouteArgs(lobby: lobby),
          initialChildren: children,
        );

  static const String name = 'ActiveUsersRoute';

  static const PageInfo<ActiveUsersRouteArgs> page =
      PageInfo<ActiveUsersRouteArgs>(name);
}

class ActiveUsersRouteArgs {
  const ActiveUsersRouteArgs({required this.lobby});

  final Lobby lobby;

  @override
  String toString() {
    return 'ActiveUsersRouteArgs{lobby: $lobby}';
  }
}

/// generated route for
/// [GameResultPage]
class GameResultRoute extends PageRouteInfo<GameResultRouteArgs> {
  GameResultRoute({
    required GameResult gameResult,
    required List<List<Letter>> myLetters,
    required List<List<Letter>> opponentLetters,
    List<PageRouteInfo>? children,
  }) : super(
          GameResultRoute.name,
          args: GameResultRouteArgs(
            gameResult: gameResult,
            myLetters: myLetters,
            opponentLetters: opponentLetters,
          ),
          initialChildren: children,
        );

  static const String name = 'GameResultRoute';

  static const PageInfo<GameResultRouteArgs> page =
      PageInfo<GameResultRouteArgs>(name);
}

class GameResultRouteArgs {
  const GameResultRouteArgs({
    required this.gameResult,
    required this.myLetters,
    required this.opponentLetters,
  });

  final GameResult gameResult;

  final List<List<Letter>> myLetters;

  final List<List<Letter>> opponentLetters;

  @override
  String toString() {
    return 'GameResultRouteArgs{gameResult: $gameResult, myLetters: $myLetters, opponentLetters: $opponentLetters}';
  }
}

/// generated route for
/// [GameWrapperPage]
class GameWrapperRoute extends PageRouteInfo<GameWrapperRouteArgs> {
  GameWrapperRoute({
    required int wordLength,
    required String gameId,
    List<PageRouteInfo>? children,
  }) : super(
          GameWrapperRoute.name,
          args: GameWrapperRouteArgs(
            wordLength: wordLength,
            gameId: gameId,
          ),
          initialChildren: children,
        );

  static const String name = 'GameWrapperRoute';

  static const PageInfo<GameWrapperRouteArgs> page =
      PageInfo<GameWrapperRouteArgs>(name);
}

class GameWrapperRouteArgs {
  const GameWrapperRouteArgs({
    required this.wordLength,
    required this.gameId,
  });

  final int wordLength;

  final String gameId;

  @override
  String toString() {
    return 'GameWrapperRouteArgs{wordLength: $wordLength, gameId: $gameId}';
  }
}

/// generated route for
/// [IngamePage]
class IngameRoute extends PageRouteInfo<void> {
  const IngameRoute({List<PageRouteInfo>? children})
      : super(
          IngameRoute.name,
          initialChildren: children,
        );

  static const String name = 'IngameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LobbiesPage]
class LobbiesRoute extends PageRouteInfo<void> {
  const LobbiesRoute({List<PageRouteInfo>? children})
      : super(
          LobbiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'LobbiesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PregamePage]
class PregameRoute extends PageRouteInfo<PregameRouteArgs> {
  PregameRoute({
    required PregameInfo pregameInfo,
    required bool isSender,
    bool isRematch = false,
    List<PageRouteInfo>? children,
  }) : super(
          PregameRoute.name,
          args: PregameRouteArgs(
            pregameInfo: pregameInfo,
            isSender: isSender,
            isRematch: isRematch,
          ),
          initialChildren: children,
        );

  static const String name = 'PregameRoute';

  static const PageInfo<PregameRouteArgs> page =
      PageInfo<PregameRouteArgs>(name);
}

class PregameRouteArgs {
  const PregameRouteArgs({
    required this.pregameInfo,
    required this.isSender,
    this.isRematch = false,
  });

  final PregameInfo pregameInfo;

  final bool isSender;

  final bool isRematch;

  @override
  String toString() {
    return 'PregameRouteArgs{pregameInfo: $pregameInfo, isSender: $isSender, isRematch: $isRematch}';
  }
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    String? resetToken,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            resetToken: resetToken,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.resetToken,
    this.userId,
  });

  final String? resetToken;

  final String? userId;

  @override
  String toString() {
    return 'SplashRouteArgs{resetToken: $resetToken, userId: $userId}';
  }
}
