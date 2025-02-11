import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class ORdividor extends StatelessWidget {
  const ORdividor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
       Container(
        height: 1.h,
        width: MediaQuery.of(context).size.width*0.5 - 40,
        color: Colors.black12,
       ),
        const Spacer(),
        Text("أو" , style: AppTextStyles.semiBold16,) , 
       const Spacer()
       , Container(
        height: 1.h,
        width: MediaQuery.of(context).size.width*0.5 - 40,
        color: Colors.black12,
       ),
      ],
    );
  }
}
