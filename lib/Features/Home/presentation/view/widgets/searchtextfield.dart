import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:svg_flutter/svg.dart';

class Searchtextfield extends StatelessWidget {
  const Searchtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x0A000000),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'ابحث عن.......',
              hintStyle:
                  AppTextStyles.regular13.copyWith(color: Appcolors.grey),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: SvgPicture.asset(
                PictureAssets.assetsImagesIconsSearchNormalIcon,
                fit: BoxFit.none,
              ),
              suffixIcon: SvgPicture.asset(
                PictureAssets.assetsImagesIconsSettingicon,
                fit: BoxFit.none,
              ))),
    );
  }
}
