import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './/Core/model/cartmodel.dart';
import './/Core/utils/assets/picture_assets.dart';
import './/Features/Cart/presentation/cubit/cart_cubit.dart';
import './/Features/Cart/presentation/view/widgets/image_of_the_cart_item.dart';
import './/Features/Cart/presentation/view/widgets/name_and_counter_of_the_item.dart';
import 'package:svg_flutter/svg.dart';

class ProductItemInCart extends StatefulWidget {
  const ProductItemInCart({super.key, required this.cartItem});
  final CartItem cartItem ;

  @override
  State<ProductItemInCart> createState() => _ProductItemInCartState();
}

class _ProductItemInCartState extends State<ProductItemInCart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             ImageOfTheCartItem(imageUrl: widget.cartItem.product.imageUrl,),
            SizedBox(
              width: 17.w,
            ),
             NameAndCounterOfTheItem(cartItem: widget.cartItem,),      
          ],
        ),
        Column(
              children: [
                GestureDetector(
                  onTap: () {
                      context.read<CartCubit>().removeProductFromCart(product: widget.cartItem);
                 
                  },
                  child: SvgPicture.asset(PictureAssets.assetsImagesIconsTrash))
              ],
            )
      ],
    );
  }
}