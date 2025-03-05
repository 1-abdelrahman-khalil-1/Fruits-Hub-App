import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/widgets/add_button.dart';
import 'package:fruitsapp/Core/utils/widgets/remove_button.dart';

class NameAndCounterOfTheItem extends StatelessWidget {
  const NameAndCounterOfTheItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "فراولة",
          style: AppTextStyles.bold13,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "3 كم",
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
            const AddButton(),
            SizedBox(
              width: 16.w,
            ),
            Text(
              "4",
              style: AppTextStyles.bold16,
            ),
            SizedBox(
              width: 16.w,
            ),
            const RemoveButton(),
          ],
        )
      ],
    );
  }
}
