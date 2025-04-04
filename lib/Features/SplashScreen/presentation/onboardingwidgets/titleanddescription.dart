import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/assets/appcolors.dart';
import '../../../../Core/utils/assets/apptextstyles.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.title,
    required this.first,
    required this.second,
    required this.description,
  });

  final String title;
  final String first;
  final String second;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(text: title, style: AppTextStyles.bold23),
            TextSpan(
                text: " $first",
                style: AppTextStyles.bold23
                    .copyWith(color: Appcolors.green500 )),
            TextSpan(
                text: second,
                style: AppTextStyles.bold23
                    .copyWith(color: const Color(0xFFF4A91F))),
          ])),
         SizedBox(height: 25.h,), 
        Text(description , style: AppTextStyles.semiBold13, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

