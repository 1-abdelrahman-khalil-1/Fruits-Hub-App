import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    super.key,
    required this.title,
    required this.trailingText,

    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String trailingText;

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 91.h,
        decoration: ShapeDecoration(
          color:  const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4) , side: BorderSide(
            color: isSelected ? Appcolors.green500 : const Color(0x33D9D9D9),
            width: 1,
          )),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 18,
            height: 18,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(
                  width: 1,
                  color: isSelected ? Appcolors.green500 : Appcolors.grey,
                ),
              ),
              color: isSelected ? Appcolors.green500 : Colors.transparent,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.semiBold13.copyWith(height: 2.5),
          ),
         
          trailing: Text(
            trailingText,
            style: AppTextStyles.bold13.copyWith(color: Appcolors.green500),
          ),
        ),
      ),
    );
  }
}
