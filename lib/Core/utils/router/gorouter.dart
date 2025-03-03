import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:fruitsapp/Features/Category/presentation/view/categoryscreen.dart';
import 'package:fruitsapp/Features/Category/presentation/view/filtering_results.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/details_for_product.dart';
import 'package:fruitsapp/Features/Home/presentation/view/homescreen.dart';
import 'package:fruitsapp/Features/Home/presentation/view/popularscreen.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboarding.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String popular = "/popular";
  static const String category = '/category';
  static const String details_for_product = 'details_for_product';
  static const String filtering_results = '/filtering_results';
  static GoRouter router = GoRouter(
    routes: [
   GoRoute(path: '/', builder: (context, state) =>  const HomeScreen()),
   GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
   GoRoute(path: login, builder: (context, state) => const LoginScreen()),
   GoRoute(path: signup , builder: (context, state) => const SignupScreen()),
   GoRoute(path: home , builder: (context, state) => const HomeScreen()),
   GoRoute(path: popular , builder: (context, state) => const PopularScreen()),
   GoRoute(path: category , builder: (context, state) => const Categoryscreen()),
   GoRoute(
    name: details_for_product ,
    path: "/$details_for_product/:id" , builder: (context, state) =>  DetailsForProduct(
    productid: int.parse(state.pathParameters["id"]!),
   )),
   GoRoute(path: filtering_results , builder: (context, state) =>  const FilteringResults())
  ]
  );
}

