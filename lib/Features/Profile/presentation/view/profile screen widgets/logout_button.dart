import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitsapp/Core/services/get_it.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/apptextstyles.dart';
import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Features/Auth/Data/repo/authrepo.dart';

import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLogoutConfirmationDialog(context),
      child: Container(
        color: Appcolors.green50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const Spacer(),
            Center(
              child: Text(
                'تسجيل الخروج',
                style: AppTextStyles.semiBold13.copyWith(
                  color: Appcolors.green500,
                ),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(PictureAssets.assetsImagesIconsLogoutIcon),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final size = MediaQuery.of(dialogContext).size;
        final buttonWidth = size.width * 0.3 ;
        
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
          ),
          content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => Navigator.of(dialogContext).pop(),
            child: const SizedBox(width: 20, height: 20),
          ),
            ),
            const SizedBox(height: 12),
            Text(
          'هل ترغب في تسجيل الخروج ؟',
          textAlign: TextAlign.center,
          style: AppTextStyles.bold16.copyWith(
            color: const Color(0xFF0C0D0D),
          ),
            ),
            const SizedBox(height: 29),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
            Navigator.of(dialogContext).pop();
            _performLogout(context);
              },
              child: Container(
            width: buttonWidth,
            height: 48.h,
            //padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: ShapeDecoration(
              color: Appcolors.green500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                'تأكيد',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold16.copyWith(
              color: Colors.white,
                ),
              ),
            ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.of(dialogContext).pop(),
              child: Container(
            width: buttonWidth,
            height: 48.h,
            //padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
              width: 1,
              color: Appcolors.green500,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                'لا ارغب',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold16.copyWith(
              color: Appcolors.green500,
                ),
              ),
            ),
              ),
            ),
          ],
            ),
          ],
        ),
          ),
        );
      }
      
    );
  }

  void _performLogout(BuildContext context) async {
    final authRepo = get_it<Authrepo>();
    final result = await authRepo.logout();
    
    result.fold(
      (errorMessage) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      },
      (success) {
        // Navigate to login screen
        context.go(AppRouter.login);
      },
    );
  }
}
