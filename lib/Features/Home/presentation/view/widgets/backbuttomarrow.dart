import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class Backbuttomarrow extends StatelessWidget {
  const Backbuttomarrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  style: ButtonStyle(
                      side: WidgetStateBorderSide.resolveWith((callback) {
                    return BorderSide(width: 0.5, color: Appcolors.kgrey);
                  }), backgroundColor: WidgetStateColor.resolveWith((callback) {
                    return Colors.white;
                  })),
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new , size: 20,)),
              Text("الأكثر مبيعًا", style: AppTextStyles.bold19),
              CircleAvatar(
                backgroundColor: Appcolors.kGreen100,
                child: SvgPicture.asset(
                  PictureAssets.assetsImagesIconsNotificationicon,
                  fit: BoxFit.fill,
                  color: Appcolors.kGreen500,
                  height: 30.h,
                  width: 30.w,
                ),
              )
            ],
          );
              
  }
}