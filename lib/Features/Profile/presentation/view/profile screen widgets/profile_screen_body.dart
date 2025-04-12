import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets/picture_assets.dart';
import '../../../../../Core/utils/widgets/headerbar.dart';
import 'build_profile_option.dart';
import 'logout_button.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.amber,
                    child: Image.asset(
                      PictureAssets.assetsImagesProfileTest,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أحمد ياسر',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'mail@mail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              onTap: ()=> context.push(AppRouter.profile_info),
            ),
            const BuildProfileOption(
              title: "طلباتي",
              image: PictureAssets.assetsImagesIconsBoxIcon,
              child: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const BuildProfileOption(
              title: "المفضلة",
              image: PictureAssets.assetsImagesIconsFavouriteIcon,
              child: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const BuildProfileOption(
              title: "الاشعارات",
              image: PictureAssets.assetsImagesIconsNotificationicon,
              child: null,
              hasswitch: true,
            ),
            const BuildProfileOption(
              title: "الوضع",
              image: PictureAssets.assetsImagesIconsMagicpenIcon,
              child: null,
              hasswitch: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "المساعدة",
                style: AppTextStyles.semiBold13,
              ),
            ),
            const BuildProfileOption(
              title: "من نحن",
              image: PictureAssets.assetsImagesIconsInfoCircleIcon,
              child: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const SizedBox(height: 16),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
