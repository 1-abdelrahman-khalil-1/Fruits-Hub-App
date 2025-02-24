import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Features/Home/presentation/view/widgets/add_to_cart_button.dart';

class NameAndPrice extends StatelessWidget {
<<<<<<< HEAD
  const NameAndPrice({
    super.key,
  });

=======
  const NameAndPrice({super.key, required this.name, required this.price,});
  final String name ;
  final int price;
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
<<<<<<< HEAD
        'فراولة',
=======
        name,
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
        textAlign: TextAlign.right,
        style: AppTextStyles.semiBold13,
      ),
      subtitle: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          children: [
            TextSpan(
<<<<<<< HEAD
              text: '30جنية ',
=======
              text: '$priceجنية ',
>>>>>>> 5989eae (connect to supabase and fetch popular products from supabase database)
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
