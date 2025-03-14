import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './/Core/utils/assets/appcolors.dart';

class ImageOfTheCartItem extends StatelessWidget {
  const ImageOfTheCartItem({
    super.key, required this.imageUrl,
  });
 final String imageUrl ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Appcolors.white,
        image:  DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}