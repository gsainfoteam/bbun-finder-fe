import 'package:bbun/app_bloc_observer.dart';
import 'package:bbun/di/locator.dart';
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  dotenv.load();
  configureDependencies();
  _initBloc();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (_) => sl<AuthBloc>()..add(const AuthEvent.load()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
          ),
        );
      },
      maximumSize: Size(475, 812),
      backgroundColor: Color(0xFFEEEEEE),
    );
  }
}

void _initBloc() {
  if (kDebugMode) {
    Bloc.observer = AppBlocObserver();
  }
}
