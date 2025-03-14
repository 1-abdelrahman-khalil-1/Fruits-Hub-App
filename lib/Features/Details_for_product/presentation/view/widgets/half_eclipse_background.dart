import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../../../Core/utils/widgets/back_arrow_button.dart';

class HalfEclipseBackground extends StatelessWidget {
  const HalfEclipseBackground({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: HalfOvalClipper(context: context),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5, 
            color: Appcolors.white, 
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: BackArrowButton(),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Center(child: CachedNetworkImage(imageUrl: imageUrl, height: 187.h, width: 201.w, fit: BoxFit.cover,)))
      ],
    );
  }
}

class HalfOvalClipper extends CustomClipper<Path> {
  final BuildContext context;

  HalfOvalClipper({super.reclip, required this.context});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100); // بداية المسار من الأسفل
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 80); // منحنى داخلي
    path.lineTo(size.width, 0); // إغلاق الشكل
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
