import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets/picture_assets.dart';

class Fruitbackground extends StatelessWidget {
  const Fruitbackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        child: Image.asset(
          PictureAssets.assetsImagesFruitTest,
          colorBlendMode: BlendMode.screen,
          fit: BoxFit.fill,
        ));
  }
}
