import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customappbar.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextform.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/logintext.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/termscheckbox.dart';

class Signupbody extends StatelessWidget {
  const Signupbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Customappbar(
              title: "حساب جديد",
            ),
            SizedBox(height: 35.h),
            const CustomTextfield(
                hinttext: "الاسم كامل",
                icon: null,
                textInputType: TextInputType.name),
            SizedBox(height: 18.h),
            const CustomTextfield(
                hinttext: "البريد الإلكتروني",
                icon: null,
                textInputType: TextInputType.emailAddress),
            SizedBox(height: 18.h),
            const CustomTextfield(
                hinttext: "كلمة المرور",
                icon: Icon(Icons.visibility),
                textInputType: TextInputType.visiblePassword),
            SizedBox(height: 18.h),
            const Termscheckbox(),
            SizedBox(height: 30.h),
            const CustomTextButton(show: true, text: "إنشاء حساب جديد" , navigatelocation: AppRouter.signup,),
            SizedBox(height: 26.h,),
            const Logintext(),
            
          ],
        ),
      ),
    );
  }
}
