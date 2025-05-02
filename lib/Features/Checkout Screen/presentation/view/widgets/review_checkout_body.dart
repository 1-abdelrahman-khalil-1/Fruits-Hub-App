import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import '../../../../../Core/utils/widgets/customtextbutton.dart';
import 'appbar_name_checkout.dart';
import 'confirm_order.dart';
import 'order_summary.dart';
import 'stepper_for_checkout.dart';

class ReviewCheckoutBody extends StatelessWidget {
  const ReviewCheckoutBody(
      {super.key,
      required this.onPressed,
      required this.onbuttonpressed, required this.onEditPaymentTap,
      });
  final void Function() onPressed, onbuttonpressed, onEditPaymentTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppbarNameCheckout(
          onPressed: () {
            onPressed();
            FocusScope.of(context).unfocus();
          },
          title: "المراجعة",
        ),
        SizedBox(height: 20.h),
        const StepperForCheckout(activeStepIndex: 2),
        SizedBox(height: 20.h),
        Text(
          'ملخص الطلب :',
          style: AppTextStyles.bold13,
        ),
        SizedBox(height: 16.h),
        const OrderSummary(),
        SizedBox(height: 16.h),
        ConfirmOrder(onEditAddressTap: onPressed, onEditPaymentTap: onEditPaymentTap),
        SizedBox(height: 90.h),
        CustomTextButton(
          text: "تأكيد الطلب",
          onpressed: () {
            onbuttonpressed();
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}

