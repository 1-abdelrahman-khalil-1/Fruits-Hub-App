import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as image;
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
class ProductOffers extends StatelessWidget {
  const ProductOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w * 0.5,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: image.Svg(
            PictureAssets.assetsImagesGreenbackgroundoffer,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.80,
              child: Text(
                'عروض العيد',
                style: AppTextStyles.regular13.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'خصم 25%',
              style: AppTextStyles.bold19.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: 116,
              height: 32,
              padding: const EdgeInsets.all(3),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r)),
              ),
              child: Center(
                child: Text(
                  'تسوق الان',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold13.copyWith(
                    color: Appcolors.kGreen600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}