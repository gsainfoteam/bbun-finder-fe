import 'package:auto_route/auto_route.dart';
import 'package:bbun/presentation/pages/onboarding_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: '/onboarding', page: OnboardingRoute.page, initial: true),
      ];
}
