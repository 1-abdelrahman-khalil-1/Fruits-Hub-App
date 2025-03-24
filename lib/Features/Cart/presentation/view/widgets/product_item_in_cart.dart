import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/widgets/item_name_and_counter_with_increase_decrease_in_cart.dart';
import './/Core/model/cartmodel.dart';
import './/Core/utils/assets/picture_assets.dart';
import './/Features/Cart/presentation/view/widgets/image_of_the_cart_item.dart';
import 'package:svg_flutter/svg.dart';

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({super.key, required this.cartItem, required this.onTap});
  final CartItem cartItem ;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             ImageOfTheCartItem(imageUrl: cartItem.product.imageUrl,),
            SizedBox(
              width: 17.w,
            ),
             ItemNameAndCounterWithIncreaseDecreaseInCart(cartItem: cartItem,),      
          ],
        ),
        Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(PictureAssets.assetsImagesIconsTrash))
              ],
            )
      ],
    );
  }
}