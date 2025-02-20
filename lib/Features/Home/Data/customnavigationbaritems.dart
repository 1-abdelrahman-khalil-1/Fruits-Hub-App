import 'package:fruitsapp/Core/utils/assets/picture_assets.dart';
import 'package:fruitsapp/Core/utils/widgets/customicons.dart';

class CustomNavigationitems {
  static List<CustomIcon> items = [
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsHomeBoldIcon,
        image: PictureAssets.assetsImagesIconsHomeIcon,
        title: "الرئيسية"),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsCategoryBoldIcon,
        image: PictureAssets.assetsImagesIconsCategoryIcon,
        title: "المنتجات"),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsShoppingCartBoldIcon,
        image: PictureAssets.assetsImagesIconsShoppingCartIcon,
        title: "سلة التسوق"),
    const CustomIcon(
        boldImage: PictureAssets.assetsImagesBoldIconsUserprofileBoldIcon,
        image: PictureAssets.assetsImagesIconsUserprofileIcon,
        title: "حسابي"),
  ];
}
