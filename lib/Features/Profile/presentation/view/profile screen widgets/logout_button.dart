import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:svg_flutter/svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolors.green50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child:  Row(
        children: [
          const Spacer(),
          Center(
            child: Text(
              'تسجيل الخروج',
              style: AppTextStyles.semiBold13.copyWith(
                color: Appcolors.green500,
              ),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(PictureAssets.assetsImagesIconsLogoutIcon),
          
        ],
      ),
    );
  }
}
