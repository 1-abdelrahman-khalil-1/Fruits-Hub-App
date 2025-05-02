import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/model/cartmodel.dart';
import '../../../../../../../Core/model/productmodel.dart';
import '../../../../../../../Core/utils/assets/picture_assets.dart';
import '../../../../../../../Core/utils/widgets/customtextbutton.dart';
import '../../../../../Core/cubit/Cart Cubit/cart_cubit.dart';
import 'description_for_product.dart';
import 'product_name_and_price_and_add_or_remove.dart';
import 'rate_and_reviewtext.dart';
import 'roundedbox_has_list_title.dart';

class DetailsForProductData extends StatefulWidget {
  const DetailsForProductData({
    super.key,
    required this.product,
  });

  final Productmodel product;

  @override
  State<DetailsForProductData> createState() => _DetailsForProductDataState();
}

class _DetailsForProductDataState extends State<DetailsForProductData> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductNameAndPriceAndAddOrRemoveFromCart(
              initialCount: counter,
              onpressed: (count) {
                setState(() {
                  counter = count; // Update the counter value
                  print('Counter updated to: $counter'); // Debug print
                });
              },
              name: widget.product.name,
              price: widget.product.price,
              product: widget.product,
            ),
            const RateAndReviewtext(),
            DescriptionForProduct(description: widget.product.description),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                const Expanded(
                  child: RoundedBoxHasListTitle(
                    title: "عام",
                    subtitle: "الصلاحيه",
                    iconimage: PictureAssets.assetsImagesCalendar,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                const Expanded(
                    child: RoundedBoxHasListTitle(
                        title: "100%",
                        subtitle: "اورجانيك",
                        iconimage: PictureAssets.assetsImagesOrganic))
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedBoxHasListTitle(
                    title: "${widget.product.calories} كالوري",
                    subtitle: "100 جرام",
                    iconimage: PictureAssets.assetsImagesFire,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                const Expanded(
                    child: RoundedBoxHasListTitle(
                        title: "4.5",
                        ratingcount: "(256) ",
                        subtitle: "Reviews",
                        iconimage: PictureAssets.assetsImagesStar))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextButton(
                text: "اضف إلى السلة",
                onpressed: () {
                  final cartItem = CartItem(widget.product, count: counter);

                  // Add to cart
                  context
                      .read<CartCubit>()
                      .addProductToCart(product: widget.product);
                  context
                      .read<CartCubit>()
                      .updateProductInCart(product: cartItem);

                  // Show success message
                  showSuccessMessage(context);
                }),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  void showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تمت إضافة ${widget.product.name} إلى السلة'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
