import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/widgets/add_button.dart';
import 'package:fruitsapp/Core/utils/widgets/remove_button.dart';

class NameAndPriceAndAddOrRemoveFromCart extends StatelessWidget {
  const NameAndPriceAndAddOrRemoveFromCart({
    super.key,
    required this.price,
    required this.name,
  });

  final int price;
  final String name;
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
          const AddButton(),
          SizedBox(width: 16.w,),
          Text("4" ,style: AppTextStyles.bold16,),
          SizedBox(width: 16.w,),
          const RemoveButton(),

        ],
      ),
    );
  }
}
