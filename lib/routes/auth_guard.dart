import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart';
import 'package:bbun/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authState =
        router.navigatorKey.currentContext!.read<AuthBloc>().state;

    if (authState.hasUser) {
      resolver.next(true);
    } else {
      router.push(const OnboardingRoute());
    }
  }
}
