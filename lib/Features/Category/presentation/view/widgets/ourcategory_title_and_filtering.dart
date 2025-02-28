import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
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
        ) ,
        InkWell(onTap: (){}, child: SvgPicture.asset(PictureAssets.assetsImagesIconsArrowSwapIcon))
      ],
    );
  }
}