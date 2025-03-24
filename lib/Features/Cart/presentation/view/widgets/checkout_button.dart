import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/model/cartmodel.dart';
import '../../../../../Core/utils/widgets/customtextbutton.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.cartItems,
  });

  final Cartmodel cartItems;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      heightFactor: 13.h,
      child: CustomTextButton(
        text: "الدفع  ${cartItems.totalprice} جنيه",
        onpressed: () {},
      ),
    );
  }
}
