import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/model/productmodel.dart';
import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../../../Core/utils/assets/fontasset.dart';
import '../../../../../../../Core/utils/widgets/add_button.dart';
import '../../../../../../../Core/utils/widgets/remove_button.dart';

class ProductNameAndPriceAndAddOrRemoveFromCart extends StatefulWidget {
  const ProductNameAndPriceAndAddOrRemoveFromCart({
    super.key,
    required this.price,
    required this.name,
    required this.product, 
    required this.onpressed,
    this.initialCount = 1,
  });
  final void Function(int value) onpressed;
  final int price;
  final String name;
  final Productmodel product;
  final int initialCount;

  @override
  State<ProductNameAndPriceAndAddOrRemoveFromCart> createState() =>
      _ProductNameAndPriceAndAddOrRemoveFromCartState();
}

class _ProductNameAndPriceAndAddOrRemoveFromCartState
    extends State<ProductNameAndPriceAndAddOrRemoveFromCart> {
  late int count;
  
  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.name,
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16.copyWith(height: 2),
      ),
      subtitle: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          children: [
            TextSpan(
              text: '${widget.price}جنية ',
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
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AddButton(
            productmodel: widget.product,
            onpressed: () {
              setState(() {
                count++;
              });
              widget.onpressed(count);
            },
          ),
          SizedBox(width: 16.w),
          Text(
           count.toString(),
            style: AppTextStyles.bold16,
          ),
          SizedBox(width: 16.w),
          RemoveButton(
            onpressed: () {
              setState(() {
                if (count > 1) { // Prevent decrease below 1
                 count--;
                }
              });
              widget.onpressed(count);

            },
          ),
        ],
      ),
    );
  }
}
