import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:fruitsapp/Features/Home/presentation/view/home.dart';
import 'package:fruitsapp/Features/Home/presentation/view/popularscreen.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboarding.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/splashscreen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String popular = "/popular";
  static GoRouter router = GoRouter(
    routes: [
   GoRoute(path: '/', builder: (context, state) =>  const Home()),
   GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
   GoRoute(path: login, builder: (context, state) => const LoginScreen()),
   GoRoute(path: signup , builder: (context, state) => const SignupScreen()),
   GoRoute(path: home , builder: (context, state) => const Home()),
   GoRoute(path: popular , builder: (context, state) => const PopularScreen()),
  ]
  );
}

