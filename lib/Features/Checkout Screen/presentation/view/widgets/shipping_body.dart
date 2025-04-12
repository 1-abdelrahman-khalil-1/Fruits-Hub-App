import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/data/model/order_model.dart';
import 'appbar_name_checkout.dart';
import 'payment_option.dart';
import 'stepper_for_checkout.dart';

class ShippingBody extends StatefulWidget {
  const ShippingBody({super.key, required this.onPressed, required this.onbuttonpressed });
  final void Function() onPressed, onbuttonpressed;
  @override
  State<ShippingBody> createState() => _ShippingBodyState();
}

class _ShippingBodyState extends State<ShippingBody> with AutomaticKeepAliveClientMixin {
  String selectedOption = "not paypal";

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    int totalprice = context.read<OrderModel>().items.totalprice;
    return Column(
      children: [
        AppbarNameCheckout(onPressed: widget.onPressed, title: "الشحن"),
        SizedBox(height: 20.h),
        const StepperForCheckout(activeStepIndex: 0),
        SizedBox(height: 40.h),
        PaymentOption(
          title: "الدفع عند الاستلام",
          trailingText: "${totalprice+10} جنيه" ,
          isSelected: selectedOption == "not paypal",
          onTap: () => selectOption("not paypal"),
        ),
        SizedBox(height: 16.h),
        PaymentOption(
          title: "الدفع بPayPal",
          trailingText: "$totalprice جنيه",
          isSelected: selectedOption == "paypal",
          onTap: () => selectOption("paypal"),
        ),
        SizedBox(height: 90.h),
        CustomTextButton(text: "التالي", onpressed:(){
      
           context.read<OrderModel>().shippingType = selectedOption;
           widget.onbuttonpressed();
        },),
      ],
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

