import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';

class ImageOfTheCartItem extends StatelessWidget {
  const ImageOfTheCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Appcolors.white,
        image: const DecorationImage(
          image: AssetImage(PictureAssets.assetsImagesStrawberryTest),
        ),
      ),
    );
  }
}