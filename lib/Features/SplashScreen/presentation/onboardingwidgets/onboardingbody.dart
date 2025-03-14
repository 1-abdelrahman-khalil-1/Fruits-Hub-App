import 'package:flutter/material.dart';
import '../../../../Core/utils/assets/picture_assets.dart';
import 'pageviewitem.dart';

class Onboardingbody extends StatelessWidget {
  const Onboardingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        Pageviewitem(
          backgroundimage: PictureAssets.assetsImagesVectororange ,
          frontimage: PictureAssets.assetsImagesFruitbasket ,
          title: "مرحبًا بك في",
          description:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          first: "Fruit",
          second: "HUB",
          show: false,
        ),
        Pageviewitem(
          backgroundimage: PictureAssets.assetsImagesVectorgreen,
          frontimage: PictureAssets.assetsImagesPineapple,
          title: "ابحث وتسوق",
          description:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          first: "",
          second: "",
          show: true,
        )
      ],
    );
  }
}
