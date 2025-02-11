import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hinttext,
    required this.icon,
    required this.textInputType,
  });
  final String hinttext;
  final Icon? icon;
  final TextInputType textInputType;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textDirection: TextDirection.rtl,
        keyboardType: widget.textInputType,
        obscureText:
            widget.textInputType == TextInputType.visiblePassword && show
                ? true
                : false,
        obscuringCharacter: '•',
        decoration: InputDecoration(
            label: Text("    ${widget.hinttext}",
                style: AppTextStyles.bold13.copyWith(color: Appcolors.kgrey)),
            fillColor: const Color.fromARGB(181, 249, 250, 250),
            filled: true,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                show = !show;
              }),
              child: Padding(
                  padding: const EdgeInsets.only(left: 30), child: iconstate()),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFE6E9E9),
              ),
            )));
  }

  Icon? iconstate() => widget.icon != null
      ? show
          ? Icon(Icons.visibility, color: Appcolors.kgrey, size: 20.sp)
          : Icon(Icons.visibility_off, color: Appcolors.kgrey, size: 20.sp)
      : null;
}
