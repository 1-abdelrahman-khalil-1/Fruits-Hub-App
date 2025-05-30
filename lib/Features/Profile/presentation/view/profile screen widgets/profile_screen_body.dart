import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/services/authentication_service.dart';
import '../../../../../Core/services/get_it.dart';
import '../../../../../Core/services/services.dart';
import '../../../../../Core/services/sharedprefrence.dart';
import '../../../../../Core/utils/assets/picture_assets.dart';
import '../../../../../Core/utils/widgets/headerbar.dart';
import '../../../../Auth/Data/model/user_model.dart';
import '../../../../Auth/Data/repo/authrepo.dart';
import '../../../../Auth/Data/repo/authrepoimpl.dart';
import 'build_profile_option.dart';
import 'logout_button.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  late UserModel user;
  late Authrepo loca;
  
  @override
  void initState() {
    super.initState();
    loca = AuthrepoImp(get_it<AuthenticationService>(), get_it<Services>());
    user = loca.getCurrentUser(key: LocalSharedprefrence.userkey);
  }
  
  // Method to refresh user data
  void refreshUserData() {
    setState(() {
      user = loca.getCurrentUser(key: LocalSharedprefrence.userkey);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderBar(
              title: "حسابي",
              showicon: false,
              shownotification: false,
            ),
            Row(
              
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.amber,
                  child: Image.asset(
                    PictureAssets.assetsImagesProfileTest,
                  ),
                ),
                const SizedBox(width: 16),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "عام",
                style: AppTextStyles.semiBold13,
              ),
            ),
             BuildProfileOption(
              title: "الملف الشخصي",
              image: PictureAssets.assetsImagesIconsUserprofileIcon,
              child: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                // Wait for the result from the profile info screen
                final result = await context.push(AppRouter.profile_info);
                // If the result is true, refresh the user data
                if (result == true) {
                  refreshUserData();
                }
              },
            ),
            const BuildProfileOption(
              title: "طلباتي",
              image: PictureAssets.assetsImagesIconsBoxIcon,
              child: Icon(Icons.arrow_forward_ios, size: 16),
            ),
             BuildProfileOption(
              title: "المفضلة",
              image: PictureAssets.assetsImagesIconsFavouriteIcon,
              child: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push(AppRouter.favourite),
            ),
            const BuildProfileOption(
              title: "الاشعارات",
              image: PictureAssets.assetsImagesIconsNotificationicon,
              child: null,
              hasswitch: true,
            ),
            SizedBox(height: 100.h),
            const LogoutButton(),
             SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
