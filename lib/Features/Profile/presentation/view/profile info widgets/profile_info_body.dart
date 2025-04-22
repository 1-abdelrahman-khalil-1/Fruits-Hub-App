
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile%20info%20widgets/custom_textfield_with_edit.dart';
import 'package:fruitsapp/backend_keys.dart';

import '../../../../../Core/services/authentication_service.dart';
import '../../../../../Core/services/get_it.dart';
import '../../../../../Core/services/services.dart';
import '../../../../../Core/utils/widgets/customtextbutton.dart';
import '../../../../../Core/utils/widgets/customtextfield.dart';
import '../../../../../Core/utils/widgets/headerbar.dart';
import '../../../../Auth/Data/model/user_model.dart';
import '../../../../Auth/Data/repo/authrepo.dart';
import '../../../../Auth/Data/repo/authrepoimpl.dart';

class ProfileInfoBody extends StatefulWidget {
  const ProfileInfoBody({super.key});

  @override
  State<ProfileInfoBody> createState() => _ProfileInfoBodyState();
}

class _ProfileInfoBodyState extends State<ProfileInfoBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  Authrepo loca =
      AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>());
 UserModel ?user;
   
  @override
  void initState() {
    super.initState();
    user = loca.getCurrentUser(key: LocalSharedprefrence.userkey);

  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
 return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBar(
                title: 'الملف الشخصي',
                showicon: true,
                shownotification: false,
              ),
              SizedBox(height: 20.h),
              Text(
                'المعلومات الشخصيه',
                style: AppTextStyles.semiBold13,
              ),
              SizedBox(height: 8.h),
              CustomTextfieldWithEdit(
                hinttext: user!.name,
                textInputType: TextInputType.text,
                controller: nameController,
                validator: (value) => null,
                onSaved: (p0) {

                  user!.name = p0 ==null || p0.isEmpty? user!.name : p0;
                },
              ),
              SizedBox(height: 8.h),
              CustomTextfieldWithEdit(
                hinttext: user!.email,
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) => null,
                onSaved: (p0) {
                user!.email = p0 == null || p0.isEmpty ? user!.email : p0;

                },
              ),
              SizedBox(height: 32.h),
              Text(
                'تغيير كلمة المرور',
                style: AppTextStyles.semiBold13,
              ),
              SizedBox(height: 8.h),
              CustomTextfield(
                hinttext: 'كلمة المرور الحالي',
                icon: const Icon(Icons.lock),
                textInputType: TextInputType.visiblePassword,
                controller: currentPasswordController,
                validator: (value) => null,
                onSaved: (p0) {
                  
                },
              ),
              SizedBox(height: 8.h),
              CustomTextfield(
                hinttext: 'كلمة المرور الجديده',
                icon: const Icon(Icons.lock),
                textInputType: TextInputType.visiblePassword,
                controller: newPasswordController,
                validator: (value) => null,
                onSaved: (p0) {
                  
                },
              ),
              SizedBox(height: 8.h),
              CustomTextfield(
                hinttext: 'تأكيد كلمة المرور الجديده',
                icon: const Icon(Icons.lock),
                textInputType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                validator: (value) => null,
                onSaved: (p0) {
                  
                },
              ),
              SizedBox(height: 50.h),
              CustomTextButton(
                text: "حفظ التغييرات",
                onpressed: () {
                
                  if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     loca.updateUserData(collectionname: BackendKeys.userCollectionKey, uid: user!.uid, data: user!.toMap());
                       } else {
                    // Handle validation errors if needed
                  }
                  setState(() {
                    
                  });
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}