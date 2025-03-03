import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Appcolors.lightwhite,
        child:  IconButton(
        onPressed: () {
           
        },
         icon: Icon(Icons.remove_rounded,
          color: Appcolors.grey,
        )),
      );
  }
}