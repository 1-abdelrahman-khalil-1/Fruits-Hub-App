import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../../../Core/utils/assets/fontasset.dart';
class RateAndReviewtext extends StatelessWidget {
  const RateAndReviewtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
              width: 150.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star , color: Appcolors.orange400, size: 25,shadows: [
                    Shadow( color: Appcolors.orange300, blurRadius: 20,),
                  ]),
                  Text("4.5", style: AppTextStyles.semiBold13,),
                  Text("(30+)", style: AppTextStyles.regular13.copyWith(color: Appcolors.grey),),
                   Text(
                    'المراجعه',
                    style: AppTextStyles.bold13.copyWith(color: Appcolors.green500 , decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
    );
  }
}