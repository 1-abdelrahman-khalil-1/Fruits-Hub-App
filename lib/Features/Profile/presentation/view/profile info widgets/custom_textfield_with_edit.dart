import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:svg_flutter/svg.dart';

class CustomTextfieldWithEdit extends StatefulWidget {
  const CustomTextfieldWithEdit({
    super.key,
    required this.hinttext,
    required this.textInputType,
    required this.onSaved,
    required this.validator,
    required this.controller,
  });
  final String hinttext;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  @override
  State<CustomTextfieldWithEdit> createState() => _CustomTextfieldWithEditState();
}

class _CustomTextfieldWithEditState extends State<CustomTextfieldWithEdit> {
  bool isReadOnly = true; // Add a flag to toggle read-only mode

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        onSaved: widget.onSaved,
        validator: widget.validator,
        textDirection: TextDirection.rtl,
        keyboardType: widget.textInputType,
        readOnly: isReadOnly, // Set the read-only property
        
        decoration: InputDecoration(
          hintText: widget.hinttext, // Always show the hint text as the current name
          hintStyle: AppTextStyles.bold13.copyWith(color: Appcolors.grey),
          fillColor: const Color.fromARGB(181, 249, 250, 250),
          filled: true,
        
          suffixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () => setState(() {
                isReadOnly = !isReadOnly; // Toggle read-only mode
              
                if (!isReadOnly) {
                  FocusScope.of(context).focusedChild; // Focus the text field
                }else {
                  FocusScope.of(context).unfocus(); // Unfocus the text field
                }
              }),
              child: SvgPicture.asset(
                PictureAssets.assetsImagesIconsEditIcon,
              
              ),
            ),
          ),
         
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFE6E9E9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color:  Color(0xFFE6E9E9),
            ),
          ),
        ));
  }
}
