import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import '../../../data/model/order_model.dart';

class OrderSummaryColumn extends StatelessWidget {
  const OrderSummaryColumn({super.key});

  @override
  Widget build(BuildContext context) {
    int price = context.read<OrderModel>().items.totalprice;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'المجموع الفرعي :',
              style: AppTextStyles.regular13
                  .copyWith(color: const Color(0xFF4E5556)),
            ),
            Text(
              '$price جنيه',
              style: AppTextStyles.semiBold16
                  .copyWith(color: const Color(0xFF0C0D0D)),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'التوصيل  :',
              style: AppTextStyles.regular13
                  .copyWith(color: const Color(0xFF4E5556)),
            ),
            Text(
              '30جنية',
              style: AppTextStyles.semiBold13
                  .copyWith(color: const Color(0xFF4E5556)),
            ),
          ],
        ),
        const Divider(
            color: Color(0xFFCACECE),
            thickness: 0.5,
            indent: 50,
            endIndent: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الكلي',
              style: AppTextStyles.bold16
                  .copyWith(color: const Color(0xFF0C0D0D)),
            ),
            Text(
              '${price + 30} جنيه',
              style: AppTextStyles.bold16
                  .copyWith(color: const Color(0xFF0C0D0D)),
            ),
          ],
        ),
      ],
    );
  }
}
