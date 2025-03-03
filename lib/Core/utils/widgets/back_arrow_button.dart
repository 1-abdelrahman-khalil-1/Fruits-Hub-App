import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/cubit/products_cubit.dart';
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
          return BorderSide(width: 0.5, color: Appcolors.snow);
        }), backgroundColor: WidgetStateColor.resolveWith((callback) {
          return Appcolors.snow;
        })),
        onPressed: () {
          context.read<ProductsCubit>().fetchPopularProducts();
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new , size: 15, color: Colors.black,));
  }
}