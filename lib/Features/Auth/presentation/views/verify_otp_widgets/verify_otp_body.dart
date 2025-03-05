import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/header.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/verify_otp_widgets/otp_field_widget.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpBody extends StatefulWidget {
  const VerifyOtpBody({super.key});

  @override
  _VerifyOtpBodyState createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  final _formKey = GlobalKey<FormState>();
   AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String pin;
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const HeaderBar(
                  title: "التحقق من الرمز",
                  showicon: true,
                  shownotification: false),
              SizedBox(
                height: 29.h,
              ),
              Text(
                "أدخل الرمز الذي أرسلناه إلى عنوان بريد التاليMaxxx@email.com",
                style:
                    AppTextStyles.semiBold16.copyWith(color: Appcolors.grey600),
              ),
              SizedBox(height: 29.h),
               OtpFieldWidget(
                onsaved: (value) {
                  pin = value!;
                  return null;
                },
                validator: (value) {
          if (value == null || value.isEmpty || value.length < 4) {
            return '';
          }
          return null;
        },
              ),
              SizedBox(height: 29.h),
               CustomTextButton(text: "تحقق من الرمز", onpressed: (){
                validateOtp();
     
              },),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  "إعادة إرسال الرمز",
                  style: AppTextStyles.semiBold16
                      .copyWith(color: Appcolors.green600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
            void validateOtp() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      context.go(AppRouter.update_password_screen);
    } else {
     setState(() {
       bar(context, error_message: "Incorrect Code PIN");
       _autovalidateMode = AutovalidateMode.always;
     });
    }
  }
}
