import 'package:flutter/material.dart';
import 'step_indicator.dart';

class StepperForCheckout extends StatelessWidget {
  const StepperForCheckout({super.key, required this.activeStepIndex});

  final int activeStepIndex; // Current active step index

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stepperitems(activeStepIndex).length, (index) {
        return stepperitems(activeStepIndex)[index];
      }),
    );
  }
}

List<StepIndicator> stepperitems(int activeStepIndex) {
  return [
    StepIndicator(
      isCheckoutStepActive: activeStepIndex >= 0, // Active if index >= 0
      stepText: "الشحن",
      stepNumber: "1",
    ),
    StepIndicator(
      isCheckoutStepActive: activeStepIndex >= 1, // Active if index >= 1
      stepText: "العنوان",
      stepNumber: "2",
    ),
    StepIndicator(
      isCheckoutStepActive: activeStepIndex >= 2, // Active if index >= 2
      stepText: "المراجعة",
      stepNumber: "3",
    ),
  ];
}
