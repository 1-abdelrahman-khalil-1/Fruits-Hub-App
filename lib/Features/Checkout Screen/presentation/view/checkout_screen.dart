import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/model/cartmodel.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/presentation/view/widgets/checkout_screen_body.dart';
import 'package:provider/provider.dart';

import '../../../../Core/services/sharedprefrence.dart';
import '../../data/model/order_model.dart';
import '../../data/model/shipping_address_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartmodel});
 final Cartmodel cartmodel;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderModel orderModel;
  @override
  initState() {
    super.initState();
    orderModel = OrderModel(
      ShippingAddressModel(
        name: "",
        phone: "",
        address: "",
        city: "",
        apartmentNumber: "",
      ),
      orderId: LocalSharedprefrence.getCurrentUserinMap(LocalSharedprefrence.userkey)['id'],
      items: widget.cartmodel,
      shippingType: "",
    );
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: ChangeNotifierProvider.value(
        value: orderModel,
        child: const CheckoutScreenBody()),
    ));
  }
}