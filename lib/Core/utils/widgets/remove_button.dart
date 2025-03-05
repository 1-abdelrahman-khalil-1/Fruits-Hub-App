import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
        backgroundColor: Appcolors.lightwhite,
        child:  IconButton(
          padding: EdgeInsets.zero,
        onPressed: () {
           
        },
         icon: Icon(Icons.remove_rounded,
         size: 22,
          color: Appcolors.grey,
        )),
      );
  }
}