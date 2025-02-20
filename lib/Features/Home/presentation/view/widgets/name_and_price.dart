import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/add_to_cart_button.dart';

class NameAndPrice extends StatelessWidget {
  const NameAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'فراولة',
        textAlign: TextAlign.right,
        style: AppTextStyles.semiBold13,
      ),
      subtitle: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          children: [
            TextSpan(
              text: '30جنية ',
              style: AppTextStyles.bold13.copyWith(color: Appcolors.kOrange500),
            ),
            TextSpan(
              text: '/ الكيلو ',
              style: AppTextStyles.semiBold13
                  .copyWith(color: Appcolors.kOrange300),
            ),
          ],
        ),
      ),
      trailing: const AddToCartButton(),
    );
  }
}
