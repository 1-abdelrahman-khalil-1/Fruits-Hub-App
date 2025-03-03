import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Appcolors.green500,
        child:  IconButton(
        onPressed: () { 
          
        },
         icon:const Icon(Icons.add,
          color: Colors.white,
        )),
      );
  }
}