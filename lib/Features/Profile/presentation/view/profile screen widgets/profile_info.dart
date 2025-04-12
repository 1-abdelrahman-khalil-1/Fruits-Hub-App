import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderBar(
            title: 'الملف الشخصي',
            showicon: true,
            shownotification: false,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المعلومات الشخصيه',
                  style: TextStyle(
                    color: const Color(0xFF0C0D0D),
                    fontSize: 13.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 1.7,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextfield(
                  hinttext: 'أحمد ياسر',
                  icon: null,
                  textInputType: TextInputType.text,
                  onSaved: (value) {},
                  validator: (value) => null,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                CustomTextfield(
                  hinttext: 'mail@mail.com',
                  icon: null,
                  textInputType: TextInputType.emailAddress,
                  onSaved: (value) {},
                  validator: (value) => null,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 32.h),
                Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(
                    color: const Color(0xFF0C0D0D),
                    fontSize: 13.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 1.7,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextfield(
                  hinttext: 'كلمة المرور الحالي',
                  icon: const Icon(Icons.lock),
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (value) {},
                  validator: (value) => null,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                CustomTextfield(
                  hinttext: 'كلمة المرور الجديده',
                  icon: const Icon(Icons.lock),
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (value) {},
                  validator: (value) => null,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                CustomTextfield(
                  hinttext: 'تأكيد كلمة المرور الجديده',
                  icon: const Icon(Icons.lock),
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (value) {},
                  validator: (value) => null,
                  controller: TextEditingController(),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.h),
              ),
              child: Center(
                child: Text(
                  'حفظ التغييرات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
