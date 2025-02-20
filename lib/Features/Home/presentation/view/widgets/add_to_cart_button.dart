import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Appcolors.kGreen500,
        child:  IconButton(
        onPressed: () { 
        },
         icon:const Icon( Icons.add,
          color: Colors.white,
        )),
      );
  }
}