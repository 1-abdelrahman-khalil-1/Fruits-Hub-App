import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:go_router/go_router.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.show, required this.text, required this.navigatelocation,
    
  });

  final bool show;
  final String text;
  final String navigatelocation;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
     context.go(navigatelocation);
     LocalSharedprefrence.set(LocalSharedprefrence.onboardingkey , true);
     },
      child: Visibility(
       visible: show,
        child: Container(
         width: 343.w,
         padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
         decoration: ShapeDecoration(
           color: Appcolors.kgreen,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16.r),
           ),
         ),
         child: Text(
               text,
               textAlign: TextAlign.center,
               style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
             ),
                ),
      ),
    );
  }
}
