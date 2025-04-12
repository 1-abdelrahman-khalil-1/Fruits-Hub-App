import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/services/sharedprefrence.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Features/Profile/presentation/view/profile%20info%20widgets/custom_textfield_with_edit.dart';

import '../../../../../Core/services/authentication_service.dart';
import '../../../../../Core/services/get_it.dart';
import '../../../../../Core/services/services.dart';
import '../../../../../Core/utils/widgets/customtextbutton.dart';
import '../../../../../Core/utils/widgets/customtextfield.dart';
import '../../../../../Core/utils/widgets/headerbar.dart';
import '../../../../Auth/Data/model/user_model.dart';
import '../../../../Auth/Data/repo/authrepo.dart';
import '../../../../Auth/Data/repo/authrepoimpl.dart';

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    Authrepo loca = AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>());
    UserModel user = loca.getCurrentUser(key: LocalSharedprefrence.userkey);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
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
              hinttext: user.name,
              textInputType: TextInputType.text,
              onSaved: (value) {},
              validator: (value) => null,
              controller: TextEditingController(),
            ),
            SizedBox(height: 8.h),
            CustomTextfieldWithEdit(
              hinttext: user.email,
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {},
              validator: (value) => null,
              controller: TextEditingController(),
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
              onSaved: (value) {},
              validator: (value) => null,
              controller: TextEditingController(),
            ),
            SizedBox(height: 8.h),
            CustomTextfield(
              hinttext: 'كلمة المرور الجديده',
              icon: const Icon(Icons.lock),
              textInputType: TextInputType.visiblePassword,
              onSaved: (value) {},
              validator: (value) => null,
              controller: TextEditingController(),
            ),
            SizedBox(height: 8.h),
            CustomTextfield(
              hinttext: 'تأكيد كلمة المرور الجديده',
              icon: const Icon(Icons.lock),
              textInputType: TextInputType.visiblePassword,
              onSaved: (value) {},
              validator: (value) => null,
              controller: TextEditingController(),
            ),
            SizedBox(height: 50.h),
            const CustomTextButton(text: "حفظ التغييرات"),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}