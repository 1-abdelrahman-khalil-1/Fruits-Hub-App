import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import '../../../../../../../Core/utils/assets/picture_assets.dart';
class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key, required this.title});
  final String title;
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
          color: Appcolors.grey,
        ),
      ),
      subtitle: Text(
        title,
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16,
      ),
      trailing: CircleAvatar(
        radius: 25.r,
        backgroundColor: Appcolors.green100,
        child: SvgPicture.asset(
          PictureAssets.assetsImagesIconsNotificationicon,
          fit: BoxFit.fill,
          color: Appcolors.green500,
          height: 30.h,
          width: 30.w,
        ),
      ),
    );
  }
}
