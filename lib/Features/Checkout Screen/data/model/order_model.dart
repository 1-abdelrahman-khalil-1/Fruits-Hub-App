import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/model/cartmodel.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/data/model/shipping_address_model.dart';

class OrderModel extends ChangeNotifier{
  final String orderId;
  final Cartmodel items;
   ShippingAddressModel shippingAddress;
   String shippingType;
  OrderModel(
    this.shippingAddress, {
    required this.shippingType,
    required this.orderId,
    required this.items,
  });
}
