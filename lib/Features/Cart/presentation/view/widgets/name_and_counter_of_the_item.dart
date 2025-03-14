import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './/Core/model/cartmodel.dart';
import './/Core/utils/assets/appcolors.dart';
import './/Core/utils/assets/fontasset.dart';
import './/Core/utils/widgets/add_button.dart';
import './/Core/utils/widgets/remove_button.dart';
import './/Features/Cart/presentation/cubit/cart_cubit.dart';

class NameAndCounterOfTheItem extends StatefulWidget {
  const NameAndCounterOfTheItem({
    super.key, required this.cartItem,
  });
final CartItem cartItem;

  @override
  State<NameAndCounterOfTheItem> createState() => _NameAndCounterOfTheItemState();
}

class _NameAndCounterOfTheItemState extends State<NameAndCounterOfTheItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.cartItem.product.name,
          style: AppTextStyles.bold13,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "${widget.cartItem.count} كم",
          style: AppTextStyles.regular13
              .copyWith(color: Appcolors.orange500),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
             AddButton(onpressed: () {
              
              widget.cartItem.increaseCount();
              setState(() {
                
              });
             //context.read<CartCubit>().addProductToCart(product:  widget.cartItem.product);
            context.read<CartCubit>().cartProducts.updateCart( widget.cartItem);

            }, productmodel: widget.cartItem.product,),
            SizedBox(
              width: 16.w,
            ),
            Text(
              widget.cartItem.count.toString(),
              style: AppTextStyles.bold16,
            ),
            SizedBox(
              width: 16.w,
            ),
             RemoveButton(onpressed: () {
              widget.cartItem.decreaseCount();
              setState(() {
                
              });
            context.read<CartCubit>().cartProducts.updateCart( widget.cartItem);
 
            },),
          ],
        )
      ],
    );
  }
}
