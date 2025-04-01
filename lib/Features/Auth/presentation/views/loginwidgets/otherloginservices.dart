import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:svg_flutter/svg.dart';

class Othersigninservices extends StatelessWidget {
  const Othersigninservices({
    super.key, required this.text, required this.image, this.ontap,
  });
 final String text , image;
 final void Function()? ontap; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(width: 1, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(image ),
            ),
            SizedBox(width:35.w),
            SizedBox(
              width: 190.w,
              child: Text(
                text,
                style: AppTextStyles.semiBold16,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
