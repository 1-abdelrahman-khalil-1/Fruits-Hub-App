import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets/appcolors.dart';
import '../../../../../Core/utils/assets/apptextstyles.dart';
import '../../../../../Core/utils/widgets/back_arrow_button.dart';

class AppbarNameCheckout extends StatelessWidget {
  const AppbarNameCheckout({
    super.key,
    required this.onPressed, required this.title,
  });

  final void Function() onPressed;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          style:
              ButtonStyle(side: WidgetStateBorderSide.resolveWith((callback) {
            return BorderSide(width: 0.5, color: Appcolors.snow);
          }), backgroundColor: WidgetStateColor.resolveWith((callback) {
            return Colors.white;
          })),
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: Colors.black,
          ),
        ),
        Text(title, style: AppTextStyles.bold19),
        const Opacity(opacity: 0, child: BackArrowButton()),
      ],
    );
  }
}
