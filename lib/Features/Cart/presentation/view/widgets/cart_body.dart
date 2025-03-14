import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './/Core/utils/assets/appcolors.dart';
import './/Core/utils/assets/fontasset.dart';
import './/Core/utils/widgets/header.dart';
import './/Features/Cart/presentation/cubit/cart_cubit.dart';
import './/Features/Cart/presentation/cubit/cart_cubit_status.dart';
import './/Features/Cart/presentation/view/widgets/product_item_in_cart.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartCubitStatus>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
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
                  "لديك ${context.watch<CartCubit>().cartProducts.cartItems.length} منتجات في سله التسوق",
                  style: AppTextStyles.regular13
                      .copyWith(color: Appcolors.green500),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductItemInCart(
                        cartItem: context
                            .watch<CartCubit>()
                            .cartProducts
                            .cartItems[index]);
                  },
                  itemCount:
                      context.watch<CartCubit>().cartProducts.cartItems.length,
                ),
              )
            ],
          ),
        );
      }, listener: (BuildContext context, CartCubitStatus state) { if(state is CartCubitAdded){setState(() {
        
      });} },
    );
  }
}
