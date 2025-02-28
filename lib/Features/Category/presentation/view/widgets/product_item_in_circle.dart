import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';

class ProductItemInCircle extends StatelessWidget {
  const ProductItemInCircle({
    super.key,
    required this.product,
  });

  final Productmodel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Appcolors.white,
          radius: 35.r,
          child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          height: 45.h,
        ),
        ),
        Text(product.name ,style: AppTextStyles.semiBold13,),
      ],
    );
  }
}
