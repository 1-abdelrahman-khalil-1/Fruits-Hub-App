import 'package:fruitsapp/Features/Auth/presentation/views/forget_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/login.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signup.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/update_password_screen.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/verify_otp_screen.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/cart_bloc_provider.dart';
import 'package:fruitsapp/Features/Category/presentation/view/categoryscreen.dart';
import 'package:fruitsapp/Features/Category/presentation/view/filtering_results.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/details_for_product.dart';
import 'package:fruitsapp/Features/Favourite/presentation/view/favourite_screen.dart';
import 'package:fruitsapp/Features/Home/presentation/view/homescreen.dart';
import 'package:fruitsapp/Core/utils/screens/popularscreen.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile_screen.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile_info.dart';
import 'package:fruitsapp/Features/Search/presentation/view/search_results_screen.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/SplashScreen/presentation/splashscreen.dart';
import 'package:go_router/go_router.dart';

import '../../../Features/Checkout Screen/presentation/view/checkout_screen.dart';
import '../../model/cartmodel.dart';
import '../../model/productmodel.dart';
import '../helper_functions/transition_page_helper.dart';

abstract class AppRouter{
  // Track current route for transition direction
  static const String _currentRoute = '/';
  
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
  static const String profile = '/profile';
  static const String profile_info = '/profile_info';
  static const String favourite = '/favourite';
  static const String search = '/search';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splashscreen()),
      GoRoute(path: onboarding, builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: signup , builder: (context, state) => const SignupScreen()),
      GoRoute(
        path: home,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            context: context,
            state: state,
            child: const HomeScreen(),
            routePath: home,
            currentRoute: _currentRoute,
            getBeginOffset: (_) => const Offset(-1.0, 0.0), // Always slide from left
          );
        },
      ),
      GoRoute(path: popular , builder: (context, state) => const PopularScreen()),
      GoRoute(
        path: category,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            context: context,
            state: state,
            child: const Categoryscreen(),
            routePath: category,
            currentRoute: _currentRoute,
            getBeginOffset: (previousRoute) {
              // If coming from cart, slide from left, otherwise from right
              return previousRoute == cart 
                  ? const Offset(-1.0, 0.0) 
                  : const Offset(1.0, 0.0);
            },
          );
        },
      ),
      GoRoute(
        name: details_for_product,
        path: "/$details_for_product",
        builder: (context, state) => DetailsForProduct(
          product: state.extra as Productmodel, // Pass the product model
        ),
      ),
      GoRoute(path: filtering_results , builder: (context, state) =>  const FilteringResults()),
      GoRoute(
        path: cart,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            context: context,
            state: state,
            child: const CartBlocProvider(),
            routePath: cart,
            currentRoute: _currentRoute,
            getBeginOffset: (previousRoute) {
              // If coming from category or home, slide from right, otherwise from left
              return (previousRoute == category || previousRoute == home)
                  ? const Offset(1.0, 0.0)
                  : const Offset(-1.0, 0.0);
            },
          );
        },
      ),
      GoRoute(path: forgetPasswordScreen , builder: (context, state) =>  const ForgetPasswordScreen()),
      GoRoute(path: verify_otp_screen , builder: (context, state) =>  const VerifyOtpScreen()),
      GoRoute(path: update_password_screen , builder: (context, state) =>  const UpdatePasswordScreen()),
      GoRoute(path: checkout_screen , builder: (context, state) =>  CheckoutScreen(cartmodel: state.extra as Cartmodel,)),
      GoRoute(
        path: profile,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            context: context,
            state: state,
            child: const ProfileScreen(),
            routePath: profile,
            currentRoute: _currentRoute,
            // Always slide from right
          );
        },
      ),
      GoRoute(path: profile_info , builder: (context, state) =>  const ProfileInfo()),
      GoRoute(path: favourite , builder: (context, state)=> const FavouriteScreen()),
      GoRoute(path: search , builder: (context, state) => const SearchResultsScreen() ),
    ],
  );
}

