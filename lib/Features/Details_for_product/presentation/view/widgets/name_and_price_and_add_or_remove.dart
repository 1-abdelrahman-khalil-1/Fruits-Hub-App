import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/model/productmodel.dart';
import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../../../Core/utils/assets/fontasset.dart';
import '../../../../../../../Core/utils/widgets/add_button.dart';
import '../../../../../../../Core/utils/widgets/remove_button.dart';
class NameAndPriceAndAddOrRemoveFromCart extends StatelessWidget {
  const NameAndPriceAndAddOrRemoveFromCart({
    super.key,
    required this.price,
    required this.name, required this.product,
  });

  final int price;
  final String name;
  final Productmodel product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        name,
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16.copyWith(height: 2),
      ),
      subtitle: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          children: [
            TextSpan(
              text: '$priceجنية ',
              style: AppTextStyles.bold13.copyWith(color: Appcolors.orange500),
            ),
            TextSpan(
              text: '/ الكيلو ',
              style:
                  AppTextStyles.semiBold13.copyWith(color: Appcolors.orange300),
            ),
          ],
        ),
      ),
      trailing:  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
           AddButton( productmodel: product,),
          SizedBox(width: 16.w,),
          Text("4" ,style: AppTextStyles.bold16,),
          SizedBox(width: 16.w,),
          const RemoveButton(),

        ],
      ),
    );
  }
}
