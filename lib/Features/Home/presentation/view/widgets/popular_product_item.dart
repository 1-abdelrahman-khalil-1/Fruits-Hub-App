import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Features/Home/Data/model/productmodel.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/name_and_price.dart';
import 'package:svg_flutter/svg.dart';

class PopularproductItem extends StatelessWidget {

  const PopularproductItem({super.key, required this.productItem});
  final Productmodel productItem;


  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(PictureAssets.assetsImagesIconsFavouriteIcon),
            Center(
        child: Image.asset(
                PictureAssets.assetsImagesStrawberryTest, 
                height: 94.h,
                width: 95.w,
              ),
            ),
             NameAndPrice(name: productItem.name , price: productItem.price,) ,
              CachedNetworkImage(
                imageUrl: productItem.imageUrl,
                height: 104.h,
                width: 115.w,
                fit: BoxFit.cover,
              ),
            
        ],
        ),
        
      ),
    );
  }
}