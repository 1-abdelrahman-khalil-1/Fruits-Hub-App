import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30.r,
        backgroundColor: Colors.amber,
        child: Image.asset(
          PictureAssets.assetsImagesProfileTest,
        ),
      ),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: AppTextStyles.regular16.copyWith(
          color: Appcolors.kgrey,
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16,
      ),
      trailing: CircleAvatar(
        radius: 25.r,
        backgroundColor: Appcolors.kGreen100,
        child: SvgPicture.asset(
          PictureAssets.assetsImagesNotificationicon,
          fit: BoxFit.fill,
          color: Appcolors.kGreen500,
          height: 30.h,
          width: 30.w,
        ),
      ),
    );
  }
}
