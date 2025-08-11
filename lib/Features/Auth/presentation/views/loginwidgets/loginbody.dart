
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Core/utils/widgets/ordividor.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/controller/LoginGetx/login_controller.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/forgetpasswordbutton.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/otherloginservices.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/loginwidgets/signuptext.dart';
import 'package:fruitsapp/Features/Home/presentation/view/homescreen.dart';
import 'package:get/get.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // GetX Controller
      final LoginController controller = Get.put(LoginController(get_it.get<Authrepo>()));


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
                showicon: true,
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
              Container(
                height: 18.h,
                color: Colors.indigo,
                ),
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
              
              // Loading indicator with GetX
              Obx(() {
                if (controller.isLoading.value) {
                  // Show loading dialog if state changes to loading
         
                    DialogLoading(context);
                  
                } else if (controller.message.isNotEmpty) {
                  // Close dialog and show message if state changes from loading
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    bar(context, message: controller.message.value);
                    
                    if (!controller.hasError.value) {
                      Future.delayed(const Duration(seconds: 1), () {
                        Get.to(const HomeScreen());
                      });
                    }

                    controller.message.value = '';
                
                }
                
                return CustomTextButton(
                  onpressed: () {
                    loginCheck(context);
                  },
                  text: "تسجيل دخول",
                );
              }),
              
              SizedBox(height: 35.h),
              const Signuptext(),
              SizedBox(height: 35.h),
              const ORdividor(),
              SizedBox(height: 16.h),
              Othersigninservices(
                text: "تسجيل بواسطة جوجل",
                image: PictureAssets.assetsImagesGoogleicon,
                ontap: () {
                  controller.signInWithGoogle();
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  void loginCheck(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      controller.login(email, password);
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
