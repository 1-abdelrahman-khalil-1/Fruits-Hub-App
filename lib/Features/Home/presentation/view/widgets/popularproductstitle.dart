import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class Popularproductstitle extends StatelessWidget {
  const Popularproductstitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [      
                Text(
                  'الأكثر مبيعًا',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.bold16,
                ), 
                const Spacer(),
                 InkWell(
                  onTap: () {
                    
                  },
                   child: Text(
                    'المزيد',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular13.copyWith(color: Appcolors.kgrey),
                                   ),
                 ),
                
              ],
            ),
    );
  }
}