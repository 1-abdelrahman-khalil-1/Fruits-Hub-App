import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
        backgroundColor: Appcolors.green500,
        child:  IconButton(
          padding: EdgeInsets.zero,
        onPressed: () { 
          
        },
         icon:const Icon(Icons.add,
         size: 22,
          color: Colors.white,
                 )),
      );
  }
}