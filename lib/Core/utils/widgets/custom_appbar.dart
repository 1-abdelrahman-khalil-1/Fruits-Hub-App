import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/back_arrow_button.dart';
import 'package:svg_flutter/svg.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key, required this.title, required this.showicon});
  final String title;
  final bool showicon;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: showicon,
                child: const BackArrowButton(),
              ),
              Text(title, style: AppTextStyles.bold19),
              CircleAvatar(
                backgroundColor: Appcolors.green100,
                child: SvgPicture.asset(
                  PictureAssets.assetsImagesIconsNotificationicon,
                  fit: BoxFit.fill,
                  color: Appcolors.green500,
                  height: 30.h,
                  width: 30.w,
                ),
              )
            ],
          );
              
  }
}

