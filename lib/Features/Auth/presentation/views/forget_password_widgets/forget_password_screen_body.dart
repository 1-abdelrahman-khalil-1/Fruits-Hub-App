import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextform.dart';
import 'package:fruitsapp/Core/utils/widgets/header.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  TextEditingController emailController = TextEditingController();
  late String email;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _key,
      autovalidateMode: _autovalidateMode,
      child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          children: [
            const HeaderBar(
                title: "نسيان كلمة المرور",
                showicon: true,
                shownotification: false,
                ),
             SizedBox(height: 30.h),
            Text(
              "لا تقلق ، ما عليك سوى كتابة البريد الكتروني الخاص بك وسنرسل رمز التحقق.",
              style: AppTextStyles.semiBold16.copyWith(
                color: Appcolors.grey,
              ),
            ),
             SizedBox(height: 30.h),
            CustomTextfield(
                hinttext: "البريد الالكتروني",
                icon: null,
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
                validator: (valid) {
                  if (valid == null || valid.isEmpty) {
                    return "يرجي إدخال بريد الإلكتروني كامل";
                  }
                  return null;
                },
                controller: emailController),
             SizedBox(height: 30.h),

            CustomTextButton(
                text: "نسيت كلمة المرور",
                onpressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    context.go(AppRouter.verify_otp_screen);
                  } else {
                    bar(context,
                        error_message: "يرجي إدخال بريد الإلكتروني كامل");
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
