import 'package:fruitsapp/Features/Auth/presentation/views/forget_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/update_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/verify_otp_screen.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/cart_bloc_provider.dart';
import 'package:fruitsapp/Features/Category/presentation/view/categoryscreen.dart';
import 'package:fruitsapp/Features/Category/presentation/view/filtering_results.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/details_for_product.dart';
import 'package:fruitsapp/Features/Home/presentation/view/homescreen.dart';
import 'package:fruitsapp/Core/utils/screens/popularscreen.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/splashscreen.dart';
import 'package:go_router/go_router.dart';

import '../../../Features/Checkout Screen/presentation/view/checkout_screen.dart';
import '../../model/cartmodel.dart';

abstract class AppRouter{
  // Track current route for transition direction
  static String _currentRoute = '/';
  
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
  static const String checkout_screen = '/checkout_screen';
  
  static GoRouter router = GoRouter(
    routes: [
   GoRoute(path: '/', builder: (context, state) => const Splashscreen()),
   GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
   GoRoute(path: login, builder: (context, state) => const LoginScreen()),
   GoRoute(path: signup , builder: (context, state) => const SignupScreen()),
   GoRoute(
    path: home,
    pageBuilder: (context, state) {
      final String previousRoute = _currentRoute;
      _currentRoute = home;
      
      return CustomTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin;
          // If coming from category or cart, slide from left
          if (previousRoute == category || previousRoute == cart) {
            begin = const Offset(-1.0, 0.0);
          } else {
            begin = const Offset(1.0, 0.0);
          }
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    },
  ),
   GoRoute(path: popular , builder: (context, state) => const PopularScreen()),
   GoRoute(
    path: category,
    pageBuilder: (context, state) {
      final String previousRoute = _currentRoute;
      _currentRoute = category;
      
      return CustomTransitionPage(
        key: state.pageKey,
        child: const Categoryscreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin;
          // If coming from cart, slide from left
          if (previousRoute == cart) {
            begin = const Offset(-1.0, 0.0);
          } 
          // If coming from home, slide from right
          else if (previousRoute == home) {
            begin = const Offset(1.0, 0.0);
          } else {
            begin = const Offset(1.0, 0.0);
          }
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    },
  ),
   GoRoute(
    name: details_for_product ,
    path: "/$details_for_product/:id" , builder: (context, state) =>  DetailsForProduct(
    productid: int.parse(state.pathParameters["id"]!),
   )),
   GoRoute(path: filtering_results , builder: (context, state) =>  const FilteringResults()),
   GoRoute(
    path: cart,
    pageBuilder: (context, state) {
      final String previousRoute = _currentRoute;
      _currentRoute = cart;
      
      return CustomTransitionPage(
        key: state.pageKey,
        child: const CartBlocProvider(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin;
          // If coming from category or home, slide from right
          if (previousRoute == category || previousRoute == home) {
            begin = const Offset(1.0, 0.0);
          } else {
            begin = const Offset(-1.0, 0.0);
          }
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    },
  ),
   GoRoute(path: forgetPasswordScreen , builder: (context, state) =>  const ForgetPasswordScreen()),
   GoRoute(path: verify_otp_screen , builder: (context, state) =>  const VerifyOtpScreen()),
   GoRoute(path: update_password_screen , builder: (context, state) =>  const UpdatePasswordScreen()),
   GoRoute(path: checkout_screen , builder: (context, state) =>  CheckoutScreen(cartmodel: state.extra as Cartmodel,)),
      ],
    
  );
}

