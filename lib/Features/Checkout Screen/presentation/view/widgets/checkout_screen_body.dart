import 'package:flutter/material.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/data/model/shipping_address_model.dart';
import 'package:fruitsapp/Features/Checkout%20Screen/presentation/view/widgets/address_body.dart';
import 'package:go_router/go_router.dart';
import 'shipping_body.dart';
import 'review_checkout_body.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  ShippingAddressModel? addressData;
  String ?shippingType ;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    pageController.animateToPage(
      pageController.page!.toInt() + 1, // Move to the next page
      duration: const Duration(milliseconds: 500), // Animation duration
      curve: Curves.easeInOut, // Smooth animation curve
    );
  }

  void goToPreviousPage() {
    if (pageController.page!.toInt() != 0) {
      pageController.animateToPage(
        pageController.page!.toInt() - 1, // Move to the previous page
        duration: const Duration(milliseconds: 500), // Animation duration
        curve: Curves.easeInOut, // Smooth animation curve
      );
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(), 
        children:  [
          ShippingBody(onPressed: ()=> goToPreviousPage(), onbuttonpressed: () => goToNextPage() ),
          AddressBody(onPressed: () => goToPreviousPage(), onbuttonpressed: () => goToNextPage()),
          ReviewCheckoutBody(onPressed: () => goToPreviousPage(), onbuttonpressed: () => goToNextPage() ),
        ],
      ),
    );
  }

}
