import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Features/Cart/presentation/cubit/Cart_Item%20Cubit/cart_item_cubit.dart';
import '../../../../../Core/cubit/Cart Cubit/cart_cubit.dart';
import './/Core/model/cartmodel.dart';
import './/Core/utils/assets/appcolors.dart';
import './/Core/utils/assets/fontasset.dart';
import './/Core/utils/widgets/add_button.dart';
import './/Core/utils/widgets/remove_button.dart';

class ItemNameAndCounterWithIncreaseDecreaseInCart extends StatelessWidget {
  const ItemNameAndCounterWithIncreaseDecreaseInCart({
    super.key,
    required this.cartItem,
  });
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cartItem.product.name,
          style: AppTextStyles.bold13,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "${cartItem.count} كم",
          style: AppTextStyles.regular13.copyWith(color: Appcolors.orange500),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddButton(
              onpressed: () {
                cartItem.increaseCount();
                context.read<CartItemCubit>().updateCartItem();
              },
              productmodel: cartItem.product,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              cartItem.count.toString(),
              style: AppTextStyles.bold16,
            ),
            SizedBox(
              width: 16.w,
            ),
            RemoveButton(
              onpressed: () {
                cartItem.decreaseCount();

                if (cartItem.count == 0) {
                  context.read<CartCubit>().removeProductFromCart(product: cartItem);
                }
                context.read<CartItemCubit>().updateCartItem();
              },
            ),
          ],
        )
      ],
    );
  }
}
