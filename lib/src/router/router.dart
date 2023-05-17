import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_application_1/src/screens/main/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/register/register_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LogInBloc(),
            child: const AuthScreen(),
          ),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => const MainScreen(),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(),
        );
    }
  }
}
