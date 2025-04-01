import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/model/productmodel.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, this.onpressed, required this.productmodel , this.showmessage=true });
  final void Function()? onpressed;
  final Productmodel productmodel;
  final bool showmessage ;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor: Appcolors.green500,
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            if (onpressed != null) {
              onpressed!();
            if(showmessage){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "تمت إضافة ${productmodel.name} إلى السلة",
                    style: const TextStyle(color: Colors.white),
                  ),
                 
                  duration: const Duration(milliseconds: 500),
                ),
              );}
            }
          },
          icon: const Icon(
            Icons.add,
            size: 22,
            color: Colors.white,
          )),
    );
  }
}
