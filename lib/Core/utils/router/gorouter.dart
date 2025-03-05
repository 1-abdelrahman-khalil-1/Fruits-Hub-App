import 'package:fruitsapp/Features/Auth/presentation/views/forget_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/update_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/verify_otp_screen.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/cart.dart';
import 'package:fruitsapp/Features/Category/presentation/view/categoryscreen.dart';
import 'package:fruitsapp/Features/Category/presentation/view/filtering_results.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/details_for_product.dart';
import 'package:fruitsapp/Features/Home/presentation/view/homescreen.dart';
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
  static const String category = '/category';
  static const String details_for_product = 'details_for_product';
  static const String filtering_results = '/filtering_results';
  static const String cart = '/cart';
  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String verify_otp_screen = '/verify_otp_screen';
  static const String update_password_screen = '/update_password_screen';
  static GoRouter router = GoRouter(
    routes: [
   GoRoute(path: '/', builder: (context, state) =>   const Splashscreen()),
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
   GoRoute(path: filtering_results , builder: (context, state) =>  const FilteringResults()),
   GoRoute(path: cart , builder: (context, state) =>  const Cart()),
   GoRoute(path: forgetPasswordScreen , builder: (context, state) =>  const ForgetPasswordScreen()),
   GoRoute(path: verify_otp_screen , builder: (context, state) =>  const VerifyOtpScreen()),
   GoRoute(path: update_password_screen , builder: (context, state) =>  const UpdatePasswordScreen()),
  ]
  );
}

