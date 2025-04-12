import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/cubit/Cart%20Cubit/cart_cubit.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SvgPicture.asset(PictureAssets.assetsImagesSuccesful),
         SizedBox(height: 33.h),
         Text(
          "تم بنجاح!",
          style: AppTextStyles.bold19,
        ),
         SizedBox(height: 33.h),
         Text(
          "شكرا لك على تسوقك معنا",
          style: AppTextStyles.regular16,
        ),
          const Spacer(),
         TextButton(
          onPressed: () {
            context.go(AppRouter.home);
            context.read<CartCubit>().clearCart();
          },
          child: Text("الرئيسية", style:AppTextStyles.bold16.copyWith(color: Appcolors.green500 , decoration: TextDecoration.underline) , )),
         SizedBox(height: 33.h),
      ],
    );
  }
}