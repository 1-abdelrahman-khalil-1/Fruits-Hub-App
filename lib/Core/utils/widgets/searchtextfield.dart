import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../assets/apptextstyles.dart';
import '../../../../../Core/utils/assets/picture_assets.dart';
import '../../../Features/Search/presentation/cubit/search_cubit.dart';

class Searchtextfield extends StatelessWidget {
  final bool readOnly;
  final VoidCallback? onTap;
  
  const Searchtextfield({
    super.key, 
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x0A000000),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          onChanged: (query) {
            if (!readOnly) {
              context.read<SearchCubit>().searchProducts(query: query);
            }
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'ابحث عن.......',
              hintStyle:
                  AppTextStyles.regular13.copyWith(color: Appcolors.grey),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: SvgPicture.asset(
                PictureAssets.assetsImagesIconsSearchNormalIcon,
                fit: BoxFit.none,
              ),
              )
      ),
    );
  }
}
