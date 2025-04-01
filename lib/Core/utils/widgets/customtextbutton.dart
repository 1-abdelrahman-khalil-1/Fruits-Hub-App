import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,  this.show = true, required this.text, this.onpressed,
    
  });

  final bool show;
  final String text;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onpressed,
      child: Visibility(
       visible: show,
        child: Container(
         width: 343.w,
         padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
         decoration: ShapeDecoration(
           color: Appcolors.green500,
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
