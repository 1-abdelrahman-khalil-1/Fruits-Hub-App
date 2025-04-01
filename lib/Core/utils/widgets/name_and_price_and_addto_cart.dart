import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/widgets/add_button.dart';
import 'package:fruitsapp/Core/cubit/Cart%20Cubit/cart_cubit.dart';
import 'package:fruitsapp/Core/cubit/Cart%20Cubit/cart_cubit_status.dart';

class NameAndPriceAndAddtoCart extends StatelessWidget {
  const NameAndPriceAndAddtoCart({
    super.key,
    required this.name,
    required this.price,
    required this.product,
  });
  final String name;
  final int price;
  final Productmodel product;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartCubitStatus>(
      listener: (context, state) {
        },
      child: ListTile(
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
                text: '$priceجنية ',
                style:
                    AppTextStyles.bold13.copyWith(color: Appcolors.orange500),
              ),
              TextSpan(
                text: '/ الكيلو ',
                style: AppTextStyles.semiBold13
                    .copyWith(color: Appcolors.orange300),
              ),
            ],
          ),
        ),
        trailing: AddButton(onpressed: () {
          context.read<CartCubit>().addProductToCart(product: product);
          
        },productmodel: product),
      ),
    );
  }
}
