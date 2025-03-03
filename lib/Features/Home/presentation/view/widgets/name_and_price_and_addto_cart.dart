import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/widgets/add_button.dart';

class NameAndPriceAndAddtoCart extends StatelessWidget {
  const NameAndPriceAndAddtoCart({
    super.key, required this.name, required this.price,
  });
  final String name;
 final int price;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
       name,
      textAlign: TextAlign.right,
        style: AppTextStyles.semiBold13,
      ),
      subtitle: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          children: [
            TextSpan(
              text: '$priceجنية ', style: AppTextStyles.bold13.copyWith(color: Appcolors.orange500),
            ),
            TextSpan(
              text: '/ الكيلو ',
              style: AppTextStyles.semiBold13
                  .copyWith(color: Appcolors.orange300),
            ),
          ],
        ),
      ),
      trailing: const AddButton(),
    );
  }
}
