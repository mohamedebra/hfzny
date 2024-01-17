import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/routes/routes.dart';
import 'package:untitled2/feature/auth/register/ui/register.dart';
import 'package:untitled2/feature/home/ui/home_screen.dart';
import '../../feature/auth/login/logic/login_cubit.dart';
import '../../feature/auth/login/ui/login.dart';
import '../../feature/auth/login/ui/widget/reset_password.dart';
import '../../feature/auth/register/logic/register_cubit.dart';
import '../../feature/onborading/ui/on_boarding_screen.dart';
import '../../feature/onborading/ui/splash.dart';
import '../../feature/path/data/model/model.dart';
import '../../feature/path/data/repo/repo_path.dart';
import '../../feature/path/logic/path_cubit.dart';
import '../../feature/path/ui/path.dart';
import '../DI/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    TabBaModel tabBaModel = TabBaModel();
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child:  LoginScreen())
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
                child:  const RegisterScreen())
        );

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.tabOne:

        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) =>  getIt<PathCubit>(),
            child: const TabOne()));


      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());


      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());

      case Routes.plan:
        return MaterialPageRoute(builder: (_) => const ResetPassword());

      default:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen());
    }
  }
}
