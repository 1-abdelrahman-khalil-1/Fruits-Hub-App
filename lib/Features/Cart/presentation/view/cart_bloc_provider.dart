import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Features/Cart/presentation/cubit/Cart_Item%20Cubit/cart_item_cubit.dart';
import './/Core/utils/widgets/mybottom_navigation_bar.dart';
import './/Features/Cart/presentation/view/widgets/cart_body.dart';

class CartBlocProvider extends StatelessWidget {
  const CartBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      bottomNavigationBar: MybottomNavigationBar(selectedindex: 2),
      body: CartBody(),
    ));
  }
}
