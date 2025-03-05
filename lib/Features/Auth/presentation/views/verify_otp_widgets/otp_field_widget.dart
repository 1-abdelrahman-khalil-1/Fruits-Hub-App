import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFieldWidget extends StatelessWidget {
  const OtpFieldWidget({super.key, this.validator, this.onsaved});
 final String? Function(String?)? validator , onsaved;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        enableActiveFill: true,
        textStyle: AppTextStyles.bold22,
        appContext: context,
        length: 4,
        validator:  validator,
        onSaved: onsaved,
        pinTheme: PinTheme(
          errorBorderColor: Colors.red,
          shape: PinCodeFieldShape.box,
          fieldHeight: 65.h,
          fieldWidth: 70.w,
          borderRadius: BorderRadius.circular(8.r),
          activeColor: Appcolors.white,
          inactiveColor: Appcolors.white,
          activeFillColor: Appcolors.white,
          selectedColor: Appcolors.orange500,
          inactiveFillColor: Appcolors.white,
          selectedFillColor: Appcolors.white,
        ),
      ),
    );
  }
}