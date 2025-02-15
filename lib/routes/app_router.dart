import 'package:auto_route/auto_route.dart';
import 'package:bbun/modules/bbun/presentation/pages/onboarding_page.dart';
import 'package:bbun/modules/bbun/presentation/pages/main_page.dart';
import 'package:bbun/routes/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: '/onboarding', page: OnboardingRoute.page, initial: true),
        AutoRoute(
            path: '/main',
            page: MainRoute.page,
            initial: false,
            guards: [AuthGuard()]),
      ];
}
