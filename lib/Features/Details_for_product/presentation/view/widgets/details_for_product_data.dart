import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/model/productmodel.dart';
import '../../../../../../../Core/utils/assets/picture_assets.dart';
import '../../../../../../../Core/utils/widgets/customtextbutton.dart';
import 'description_for_product.dart';
import 'name_and_price_and_add_or_remove.dart';
import 'rate_and_reviewtext.dart';
import 'roundedbox_has_list_title.dart';
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
            NameAndPriceAndAddOrRemoveFromCart(name: product.name, price: product.price, product: product,),
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
             CustomTextButton( text: "اضف إلى السلة", onpressed: (){
               
            },),
            SizedBox(height: 24.h,),

          ],
        ),
      ),
    );
  }
}