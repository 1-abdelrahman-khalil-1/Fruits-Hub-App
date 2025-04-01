import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/back_arrow_button.dart';
import 'package:svg_flutter/svg.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key, required this.title, required this.showicon, required this.shownotification});
  final String title;
  final bool showicon , shownotification;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: showicon?1 : 0,
                child: const BackArrowButton(),
              ),
              Text(title, style: AppTextStyles.bold19),
              Opacity(
                opacity: shownotification?1:0,
                child: CircleAvatar(
                  backgroundColor: Appcolors.green100,
                  child: SvgPicture.asset(
                    PictureAssets.assetsImagesIconsNotificationicon,
                    fit: BoxFit.fill,
                    color: Appcolors.green500,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
              )
            ],
          );
              
  }
}

