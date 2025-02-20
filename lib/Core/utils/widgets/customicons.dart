import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:svg_flutter/svg.dart';

class CustomIcon extends StatelessWidget {
  @override
  const CustomIcon(
      {super.key,
      required this.image,
      required this.title,
      this.selected = false,
      required this.boldImage});
  final String image, title, boldImage;
  final bool selected;
  @override
  Widget build(BuildContext context) {
  return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300), 
      switchInCurve: Curves.ease,
      child: selected
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 105.w,
              height: 35.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFEEEEEE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Appcolors.kGreen500,
                  child: SvgPicture.asset(
                    boldImage,
                    height: 18.h,
                    width: 18.h,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.semiBold11
                        .copyWith(color: Appcolors.kGreen500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : SvgPicture.asset(image));
  }

  CustomIcon copyWith({bool? selected}) {
    return CustomIcon(
      image: image,
      title: title,
      selected: selected ?? this.selected,
      boldImage: boldImage,
    );
  }
}
