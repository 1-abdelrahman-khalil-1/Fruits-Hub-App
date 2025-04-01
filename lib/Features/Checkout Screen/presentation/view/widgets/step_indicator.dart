import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.isCheckoutStepActive,
    required this.stepText,
    required this.stepNumber,
  });
  final bool isCheckoutStepActive;
  final String stepText, stepNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isCheckoutStepActive
            ? CircleAvatar(
                radius: 15.r,
                backgroundColor: Appcolors.green500,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 17.w,
                ),
              )
            : CircleAvatar(
                radius: 15.r,
                backgroundColor: Appcolors.white,
                child: Text(stepNumber),
              ),
        SizedBox(width: 5.w),
        Text(
          stepText,
          style: AppTextStyles.bold13.copyWith(
            color: isCheckoutStepActive ? Appcolors.green500 : Appcolors.grey,
          ),
        ),
      ],
    );
  }
}
