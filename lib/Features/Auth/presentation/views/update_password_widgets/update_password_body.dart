import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/helperFunctions/bar.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextbutton.dart';
import 'package:fruitsapp/Core/utils/widgets/customtextfield.dart';
import 'package:fruitsapp/Core/utils/widgets/headerbar.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class UpdatePasswordBody extends StatelessWidget {
  const UpdatePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    late var newpasswordController = TextEditingController();
    late var confirmpasswordController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderBar(title: "كلمة مرور جديدة", showicon: true, shownotification: false),
                SizedBox(height: 30.h),
                Text("قم بإنشاء كلمة مرور جديدة لتسجيل الدخول" , style: AppTextStyles.semiBold16,),
                SizedBox(height: 34.h),
                CustomTextfield(hinttext: "ادخل كلمة مرور جديدة", icon: const Icon(Icons.visibility), textInputType: TextInputType.visiblePassword, onSaved: (value){}, validator: (valid){
                  return null;
                }, controller: newpasswordController),
                SizedBox(height: 24.h),
                CustomTextfield(hinttext: "تأكيد كلمة مرور الجديدة", icon: const Icon(Icons.visibility), textInputType: TextInputType.visiblePassword, onSaved: (value){}, validator: (valid){
                  return null;
                }, controller: confirmpasswordController),
                SizedBox(height: 24.h),
                CustomTextButton(text: "إنشاء كلمة مرور جديدة" , onpressed: (){
                  if(newpasswordController.text == confirmpasswordController.text){
                    succesfulLogin(context);
                    Future.delayed(const Duration(seconds: 2), () {
                    context.go(AppRouter.login);
                    });
                  }else{
                    bar(context, message: "كلمة المرور الجديدة غير متطابقة");
                  }
                },),
              ],
             ),
      ),
    );
  }

  Future<dynamic> succesfulLogin(BuildContext context) {
    return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(),
                         content:  Column( 
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        SvgPicture.asset(PictureAssets.assetsImagesSuccesful),
                        SizedBox(height: 29.h,),
                        Text("تم تغيير الباسورد بنجاح" , style: AppTextStyles.bold16,)
                      ]));
                    }
                  );
  }
}