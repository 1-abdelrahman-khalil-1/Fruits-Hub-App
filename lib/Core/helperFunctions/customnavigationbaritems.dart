import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/router/gorouter.dart';
import 'package:fruitsapp/Core/utils/widgets/customicons.dart';

class CustomNavigationitems {
  static List<CustomIcon> items = [
     const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsHomeBoldIcon,
        image: PictureAssets.assetsImagesIconsHomeIcon,
        title: "الرئيسية",
        approuter: AppRouter.home,),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsCategoryBoldIcon,
        image: PictureAssets.assetsImagesIconsCategoryIcon,
        title: "المنتجات",approuter: AppRouter.category,),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsShoppingCartBoldIcon,
        image: PictureAssets.assetsImagesIconsShoppingCartIcon,
        title: "سلة التسوق",approuter: AppRouter.cart,),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsUserprofileBoldIcon,
        image: PictureAssets.assetsImagesIconsUserprofileIcon,
        title: "حسابي" ,approuter: AppRouter.profile,),
  ];
}
