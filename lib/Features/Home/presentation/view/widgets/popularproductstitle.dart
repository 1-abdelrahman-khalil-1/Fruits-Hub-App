import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:go_router/go_router.dart';

class Popularproductstitle extends StatelessWidget {
  const Popularproductstitle({super.key, required this.showmore});
  final bool showmore;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: AppTextStyles.bold16,
          ),
          const Spacer(),
          Visibility(
            visible: showmore,
            child: InkWell(
              onTap: () {
                context.push(AppRouter.popular);
              },
              child: Text(
                'المزيد',
                textAlign: TextAlign.center,
                style: AppTextStyles.regular13.copyWith(color: Appcolors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
