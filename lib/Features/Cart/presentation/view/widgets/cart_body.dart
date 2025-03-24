import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/fontasset.dart';
import '../../../../../Core/utils/widgets/header.dart';
import '../../../../../Core/cubit/Cart Cubit/cart_cubit.dart';
import '../../cubit/Cart_Item Cubit/cart_item_cubit.dart';
import 'cart_items_list.dart';
import 'checkout_button.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        var cartItems = context.read<CartCubit>().cartProducts;
        return Stack(
          children: [
            ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: HeaderBar(
                      title: "السلة", showicon: true, shownotification: false),
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  color: Appcolors.green50,
                  child: Center(
                      child: Text(
                    "لديك ${cartItems.cartItems.length} منتجات في سله التسوق",
                    style: AppTextStyles.regular13
                        .copyWith(color: Appcolors.green500),
                  )),
                ),
                CartItemsList(cartItems: cartItems),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            CheckoutButton(cartItems: cartItems),
          ],
        );
      },
    );
  }
}
