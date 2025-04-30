import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/favourite_icon.dart';
import 'package:fruitsapp/Core/utils/widgets/name_and_price_and_addto_cart.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productItem  , this.favourite = false});
  final Productmodel productItem;
 final bool favourite ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
           context.pushNamed(AppRouter.details_for_product , extra: productItem);
       },
      child: Container(
        color: Appcolors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FavouriteIcon(product: productItem,),
              Center(
                child: CachedNetworkImage(
                  imageUrl: productItem.imageUrl,
                  height: 94.h,
                  width: 105.w,
                  fit: BoxFit.cover,
                ),
              ),
              NameAndPriceAndAddtoCart(
                name: productItem.name,
                price: productItem.price,
                product: productItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
