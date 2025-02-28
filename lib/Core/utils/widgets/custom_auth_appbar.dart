import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class CustomAuthappbar extends StatelessWidget {
  const CustomAuthappbar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              } else {
                SystemNavigator.pop();
              }
            },
            child: SvgPicture.asset(PictureAssets.assetsImagesBackarrow),
          ),
          SizedBox(
            width: 95.w,
          ),
          Text(
            title,
            style: AppTextStyles.bold19,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}