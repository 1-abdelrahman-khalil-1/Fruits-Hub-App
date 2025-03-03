import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/widgets/description_for_product.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/widgets/name_and_price_and_add_or_remove.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/widgets/rate_and_reviewtext.dart';
import 'package:fruitsapp/Features/Details_for_product/presentation/view/widgets/roundedbox_has_list_title.dart';

class DetailsForProductData extends StatelessWidget {
  const DetailsForProductData({
    super.key,
    required this.product,
  });

  final Productmodel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndPriceAndAddOrRemoveFromCart(name: product.name, price: product.price),
            const RateAndReviewtext(),
            DescriptionForProduct(description: product.description),
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
                        subtitle: "اوجانيك",
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
                    title: "${product.calories} كالوري",
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
            SizedBox(height: 24.h,),
            const CustomTextButton( text: "اضف إلى السلة",),
            SizedBox(height: 24.h,),

          ],
        ),
      ),
    );
  }
}