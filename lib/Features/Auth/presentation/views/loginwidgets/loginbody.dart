import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Core/utils/widgets/ordividor.dart';
import 'package:fruitsapp/Features/Auth/presentation/Cubits/Logincubit/login_cubit.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/forgetpasswordbutton.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/otherloginservices.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/signuptext.dart';

class Loginbody extends StatefulWidget {
  const Loginbody({super.key});

  @override
  State<Loginbody> createState() => _LoginbodyState();
}

class _LoginbodyState extends State<Loginbody> {
  late String email;
  late String password;
  var autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(text: 'customer@demo.com');
  final TextEditingController passwordController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const HeaderBar(
                title: "تسجيل دخول",
                showicon: false,
                shownotification: false,
              ),
              SizedBox(height: 35.h),
              CustomTextfield(
                controller: emailController,
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "يرجي إدخال بريد الإلكتروني كامل";
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                hinttext: "البريد الإلكتروني",
                icon: null,
              ),
              SizedBox(height: 18.h),
              CustomTextfield(
                controller: passwordController,
                onSaved: (value) {
                  password = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "يرجي إدخال كلمة المرور ";
                  }
                  return null;
                },
                textInputType: TextInputType.visiblePassword,
                hinttext: "كلمة المرور",
                icon: Icon(
                  Icons.visibility,
                  color: Appcolors.grey,
                  size: 24.w,
                ),
              ),
              SizedBox(height: 18.h),
              const Forgetasswordbutton(),
              SizedBox(height: 35.h),
              CustomTextButton(
                onpressed: () {
                  LoginCheck(context);
                },
                text: "تسجيل دخول",
              ),
              SizedBox(height: 35.h),
              const Signuptext(),
              SizedBox(height: 35.h),
              const ORdividor(),
              SizedBox(height: 16.h),
              Othersigninservices(
                text: "تسجيل بواسطة جوجل",
                image: PictureAssets.assetsImagesGoogleicon,
                ontap: () {
                  context.read<LoginCubit>().signInWithGoogle();
                },
              ),
              SizedBox(height: 32.h),
              Stack(
                alignment: Alignment.topRight,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFFBEB),
                          Color(0xFFFEF3C7),
                        ],
                      ),
                      border: Border.all(
                        color: const Color(0xFFFDE68A),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.elliptical(32, 16),
                          bottomRight: Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(-4, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "الأكونت التجريبي :",
                              style: AppTextStyles.bold14
                                  .copyWith(color: const Color(0xFF78350F)),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "اسم المستخدم :",
                              style: AppTextStyles.bold13
                                  .copyWith(color: const Color(0xFF92400E)),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "customer@demo.com",
                              style: AppTextStyles.regular14
                                  .copyWith(color: const Color(0xFF78350F)),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "كلمة المرور:",
                              style: AppTextStyles.bold13
                                  .copyWith(color: const Color(0xFF92400E)),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "12345678",
                              style: AppTextStyles.regular14
                                  .copyWith(color: const Color(0xFF78350F)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16,
                    left: 16,
                    top: -18,
                    child: Transform.rotate(
                      angle: 0.25,
                      child: const Icon(
                        Icons.push_pin_outlined,
                        size: 36,
                        color: Color(0xFF6B7280), // Slate grey clip
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void LoginCheck(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      context.read<LoginCubit>().login(email, password);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
