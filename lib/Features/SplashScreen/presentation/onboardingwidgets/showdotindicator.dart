import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
class ShowDotIndicator extends StatelessWidget {
  const ShowDotIndicator({
    super.key,
    required this.show,
  });

  final bool show;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
    dotsCount: 2,
    decorator:  DotsDecorator(
      shape: const OvalBorder() ,
      color:Appcolors.kgreen.withOpacity(show ?1 : 0.5) ,
      activeColor:Appcolors.kgreen, 
      size: Size.square(show ? 11.w:9.w) ,
      activeSize: Size.square(11.w)
    ),
    );
  }
}

