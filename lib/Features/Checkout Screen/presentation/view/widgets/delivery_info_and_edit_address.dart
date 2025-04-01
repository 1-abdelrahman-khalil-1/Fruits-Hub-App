import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import '../../../../../Core/utils/assets/picture_assets.dart';

class DeliveryInfoAndEditAddress extends StatelessWidget {
  const DeliveryInfoAndEditAddress({super.key, required this.ontap});
 final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'عنوان التوصيل',
          style: AppTextStyles.bold13.copyWith(color: Colors.black),
        ),
        InkWell(
          onTap: ontap,
          child: Row(
            children: [
              SvgPicture.asset(PictureAssets.assetsImagesIconsEditIcon),
              SizedBox(width: 4.w),
              Text(
                'تعديل',
                style: AppTextStyles.semiBold13.copyWith(color: Appcolors.grey600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
