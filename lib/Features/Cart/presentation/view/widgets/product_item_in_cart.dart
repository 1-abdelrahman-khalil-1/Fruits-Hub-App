import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/widgets/image_of_the_cart_item.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/widgets/name_and_counter_of_the_item.dart';
import 'package:svg_flutter/svg.dart';

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const ImageOfTheCartItem(),
            SizedBox(
              width: 17.w,
            ),
            const NameAndCounterOfTheItem(),      
          ],
        ),
        Column(
              children: [
                SvgPicture.asset(PictureAssets.assetsImagesIconsTrash)
              ],
            )
      ],
    );
  }
}