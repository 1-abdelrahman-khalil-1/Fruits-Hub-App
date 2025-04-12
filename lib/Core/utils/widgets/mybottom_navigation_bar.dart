import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/customnavigationbaritems.dart';
import 'package:go_router/go_router.dart';

class MybottomNavigationBar extends StatefulWidget {
  const MybottomNavigationBar({super.key ,required this.selectedindex} );
  final int selectedindex ;
  @override
  State<MybottomNavigationBar> createState() => _MybottomNavigationBarState();
}

class _MybottomNavigationBarState extends State<MybottomNavigationBar> {
  late int _seletedindex ;
  @override
  void initState() {
    super.initState();
    _seletedindex = widget.selectedindex;
  }
  @override
  
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
          width: 375.w,
          height: 70.h,
          decoration: ShapeDecoration(
            color: isDarkMode ? const Color(0x00171717) : const Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 5,
                offset: Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                CustomNavigationitems.items.length,
                (index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          _seletedindex = index;
                          context.go(CustomNavigationitems.items[index].approuter);
                        });
                      },
                      child: CustomNavigationitems.items[index]
                          .copyWith(selected: _seletedindex == index));
                },
              ),
            ),
          ));
  }
}