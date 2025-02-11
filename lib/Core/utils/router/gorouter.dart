import 'package:fruitsapp/Features/Auth/presentation/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/signup.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboarding.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/splashscreen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String termsandconditions = '/termsandconditions';
  static GoRouter router =GoRouter(
    routes: [
   GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
   GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
   GoRoute(path: login, builder: (context, state) => const LoginScreen()),
   GoRoute(path: signup , builder: (context, state) => const SignupScreen()),
  ]
  );
}