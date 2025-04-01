import 'package:flutter/material.dart';

import '../../../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';

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


