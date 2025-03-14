import 'package:flutter/material.dart';
import './/Core/utils/widgets/mybottom_navigation_bar.dart';
import './/Features/Cart/presentation/view/widgets/cart_body.dart';

class Cart extends StatelessWidget {
  const Cart({
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
