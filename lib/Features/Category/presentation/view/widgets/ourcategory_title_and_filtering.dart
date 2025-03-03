import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Category/presentation/view/widgets/choices_on_bottom_sheet.dart';
import 'package:svg_flutter/svg.dart';

class OurCategoryTitleAndFiltering extends StatelessWidget {
  const OurCategoryTitleAndFiltering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'منتجاتنا',
          style: AppTextStyles.bold16,
        ),
        InkWell(
            onTap: () {
              myChoicesBottomsheet(context);
            },
            child:
                SvgPicture.asset(PictureAssets.assetsImagesIconsArrowSwapIcon))
      ],
    );
  }

  Future<dynamic> myChoicesBottomsheet(BuildContext context) {
    return showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                      height: 314.h,
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          )), child:const ChoicesOnBottomSheet() 
                             
                          );
                });
  }
}
