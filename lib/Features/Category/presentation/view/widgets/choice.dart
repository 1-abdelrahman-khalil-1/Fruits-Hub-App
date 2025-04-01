
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';

class Choice extends StatefulWidget {
  const Choice({super.key, required this.text, required this.check, this.onChanged});
  final String text;
  final bool check;
  final void Function(bool?)? onChanged;
  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
 late bool check;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check = widget.check;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.black,
          activeColor: Colors.black,
          value: widget.check,
          shape: const CircleBorder(),
          onChanged: widget.onChanged,
        ),
        SizedBox(width: 16.w),
        Text(
          widget.text,
          style: AppTextStyles.bold13,
        )]);
  }
}