import 'package:flutter/material.dart';
import 'package:fruitsapp/Core/utils/assets/appcolors.dart';
import 'package:fruitsapp/Core/utils/assets/fontasset.dart';

class DescriptionForProduct extends StatelessWidget {
  const DescriptionForProduct({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Text(
        description,
        style: AppTextStyles.regular13.copyWith(color: Appcolors.grey),
      ),
    );
  }
}


