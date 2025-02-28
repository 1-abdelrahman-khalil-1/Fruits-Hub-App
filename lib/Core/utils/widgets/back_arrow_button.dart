import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:go_router/go_router.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        style: ButtonStyle(
            side: WidgetStateBorderSide.resolveWith((callback) {
          return BorderSide(width: 0.5, color: Appcolors.grey);
        }), backgroundColor: WidgetStateColor.resolveWith((callback) {
          return Colors.white;
        })),
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new , size: 20,));
  }
}