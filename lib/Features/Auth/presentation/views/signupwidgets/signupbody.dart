import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/helperFunctions/dialogloading.dart';
import 'package:fruitsapp/Core/helperFunctions/isWeakPassword.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';
import 'package:fruitsapp/Features/Auth/presentation/controller/SignupGetx/signup_controller.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/logintext.dart';
import 'package:fruitsapp/Features/Auth/presentation/views/signupwidgets/termscheckbox.dart';
import 'package:get/get.dart';

class Signupbody extends StatefulWidget {
  const Signupbody({super.key});

  @override
  State<Signupbody> createState() => _SignupbodyState();
}

class _SignupbodyState extends State<Signupbody> {
  late String password, email, name;
  var autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool termaccepted = false;

  final SignupController controller = Get.put(SignupController(get_it.get<Authrepo>()));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const HeaderBar(
                title: "حساب جديد",
                showicon: false,
                shownotification: false,
              ),
              SizedBox(height: 35.h),
              CustomTextfield(
                  controller: nameController,
                  onSaved: (value) {
                    name = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "يرجي إدخال الاسم كامل";
                    }
                    return null;
                  },
                  hinttext: "الاسم كامل",
                  icon: null,
                  textInputType: TextInputType.name),
              SizedBox(height: 18.h),
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
                  hinttext: "البريد الإلكتروني",
                  icon: null,
                  textInputType: TextInputType.emailAddress),
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
                  hinttext: "كلمة المرور",
                  icon: const Icon(Icons.visibility),
                  textInputType: TextInputType.visiblePassword),
              SizedBox(height: 18.h),
              Termscheckbox(
                onChanged: (check) {
                  setState(() {
                    termaccepted = check!;
                  });
                },
              ),
              SizedBox(height: 30.h),
              Obx(() {
                if (controller.isLoading.value) {
                  DialogLoading(context);
                } else if (controller.message.isNotEmpty) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  bar(context, message: controller.message.value);

                  if (!controller.hasError.value) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Get.back();
                    });
                  }
                  controller.message.value = '';
                }
                return CustomTextButton(
                  onpressed: () {
                    checkIfSignupIsValidOrNot(context);
                  },
                  text: "إنشاء حساب جديد",
                );
              }),
              SizedBox(
                height: 26.h,
              ),
              const Logintext(),
            ],
          ),
        ),
      ),
    );
  }

  void checkIfSignupIsValidOrNot(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      if (termaccepted == false) {
        bar(context, message: "يرجى الموافقة على الشروط والأحكام");
      } else if (isWeakPassword(password)) {
        bar(context,
            message:
                " 🔑 كلمة المرور ضعيفة، يرجى اختيار كلمة أقوى. يجب أن تحتوي على حرف و رقم وأن لا يقل عن 8 أحرف");
      } else {
        controller.signup(name, email, password);
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
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
