import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> buildTransitionPage({
  required BuildContext context, 
  required GoRouterState state,
  required Widget child,
  required String routePath,
  required String currentRoute,
  Offset Function(String previousRoute)? getBeginOffset,
}) {
  final String previousRoute = currentRoute;
  
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin;
      
      if (getBeginOffset != null) {
        begin = getBeginOffset(previousRoute);
      } else {
        begin = const Offset(1.0, 0.0); // Default: slide from right
      }
      
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
