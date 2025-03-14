import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../../../Core/utils/assets/fontasset.dart';
class RoundedBoxHasListTitle extends StatelessWidget {
  const RoundedBoxHasListTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconimage, this.ratingcount="",
  });
  final String title, subtitle, iconimage , ratingcount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.2, color: Appcolors.grey),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: ratingcount,
              style: AppTextStyles.semiBold13.copyWith(color: Appcolors.grey),
            ),
            TextSpan(
              text: title,
              style: AppTextStyles.bold16
                  .copyWith(color: Appcolors.green400, height: 2),
            ),
          ],
        )),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.semiBold13.copyWith(color: Appcolors.grey),
        ),
        trailing: SvgPicture.asset(iconimage),
      ),
    );
  }
}