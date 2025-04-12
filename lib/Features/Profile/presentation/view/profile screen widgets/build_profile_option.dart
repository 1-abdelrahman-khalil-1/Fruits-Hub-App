import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/Core/cubit/ThemeCubit/theme_cubit.dart';

class BuildProfileOption extends StatefulWidget {
  const BuildProfileOption({super.key, required this.title, required this.child, required this.image, this.hasswitch = false, this.onTap});
  final String title;
  final Widget? child;
  final String image;
  final bool hasswitch ;
  final void Function()? onTap;
  @override
  State<BuildProfileOption> createState() => _BuildProfileOptionState();
}

class _BuildProfileOptionState extends State<BuildProfileOption> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding:  EdgeInsets.zero,
            title: Text(
              widget.title,
              style: AppTextStyles.semiBold14.copyWith(
                color: Appcolors.grey600,
              ),
            ),
            trailing: widget.hasswitch? AdvancedSwitch(
                  initialValue: isSwitched,
                  height: 25.h,
                  width: 40.w,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                    if (widget.title == "الوضع") {
                      context.read<ThemeCubit>().toggleTheme(isSwitched);
                    }
                  },
                ) :widget.child ,
            leading: SvgPicture.asset(widget.image ,color: Appcolors.green500,),
          ),
        const Divider(
              color: Color(0xFFCACECE),
              thickness: 0.5,
              indent: 20,
              endIndent: 20),
      
        ],
      ),
    );
  }
}