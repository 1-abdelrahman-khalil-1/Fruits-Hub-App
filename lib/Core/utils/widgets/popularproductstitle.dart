import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/fontasset.dart';
import '../../../../../Core/utils/router/gorouter.dart';
class Popularproductstitle extends StatelessWidget {
  const Popularproductstitle({super.key, required this.showmore, required this.title});
  final bool showmore ;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
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
