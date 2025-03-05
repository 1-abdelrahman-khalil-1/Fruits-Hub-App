import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/widgets/header.dart';
import 'package:fruitsapp/Features/Cart/presentation/view/widgets/product_item_in_cart.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Center(child: Text("لديك 1 منتجات في سله التسوق" , style: AppTextStyles.regular13.copyWith(color: Appcolors.green500),)),
            
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ProductItemInCart(),
          )
        ],
      ),
    );
  }
}
