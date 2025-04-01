import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/widgets/product_item_in_cart.dart';
import '../../../../../Core/model/cartmodel.dart';
import '../../../../../Core/cubit/Cart Cubit/cart_cubit.dart';
import '../../cubit/Cart_Item Cubit/cart_item_cubit.dart';
class CartItemsList extends StatelessWidget {
  const CartItemsList({
    super.key,
    required this.cartItems,
  });

  final Cartmodel cartItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProductItemInCart(
                  cartItem: cartItems.cartItems[index],
                  onTap: () {
                    context.read<CartCubit>().removeProductFromCart(product: cartItems.cartItems[index]);
                    context.read<CartItemCubit>().updateCartItem();
                  },
                ),
              );
            },
            itemCount: cartItems.cartItems.length, separatorBuilder: (BuildContext context, int index) { 
              return const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 0.1
              );
            },
          ),
        );
      },
    );
  }
}
