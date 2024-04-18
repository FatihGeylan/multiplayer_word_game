import 'package:auto_route/auto_route.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/home/domain/models/game_result.dart';
import '../features/home/domain/models/letter.dart';
import '../features/home/domain/models/lobby.dart';
import '../features/home/domain/models/pregame_info.dart';
import '../features/home/presentation/pages/active_users_page.dart';
import '../features/home/presentation/pages/game_result_page.dart';
import '../features/home/presentation/pages/ingame_page.dart';
import '../features/home/presentation/pages/lobbies_page.dart';
import '../features/home/presentation/pages/pregame_page.dart';
import '../splash_page.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget|Tab,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: LobbiesRoute.page),
        AutoRoute(page: ActiveUsersRoute.page),
        AutoRoute(page: PregameRoute.page),
        AutoRoute(
          page: GameWrapperRoute.page,
          children: [
            AutoRoute(page: IngameRoute.page, initial: true),
            AutoRoute(page: GameResultRoute.page),
          ],
        ),
      ];
}
