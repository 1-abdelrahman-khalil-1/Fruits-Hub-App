import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import '../../../data/model/order_model.dart';
import 'delivery_info_and_edit_address.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key, required this.ontap});
final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'يرجي تأكيد  طلبك',
          style: AppTextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: ShapeDecoration(
            color: Appcolors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               DeliveryInfoAndEditAddress(ontap: ontap,),
              SizedBox(height: 8.h),
              Text(
                context.read<OrderModel>().shippingAddress.toString(),
                style:AppTextStyles.regular16.copyWith(color: Appcolors.grey600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
