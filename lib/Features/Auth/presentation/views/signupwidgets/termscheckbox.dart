
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/termsandconditionstext.dart';

class Termscheckbox extends StatefulWidget {
  const Termscheckbox({super.key,  this.onChanged});
  final  void Function(bool?)? onChanged;
  @override
  State<Termscheckbox> createState() => _TermscheckboxState();
}

class _TermscheckboxState extends State<Termscheckbox> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: check,
          
          fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (check == false) {
              return Colors.white;
            }
            return Appcolors.green;
          
          }),
          onChanged: (value) {
            setState(() {
              check = value!;
            });
          widget.onChanged?.call(value);
          },
          // focusColor: Appcolors.kgreen,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        const Termsandconditionstext(),
      ],
    );
  }
}
