import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'custom_button.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({
    Key? key,
    required this.bottomHeight,
    this.horizontalWidth = 15.0,
    required this.totalSteps,
    required this.currentStep,
    required this.tabController,
    this.text = 'NEXT STEP',
    this.function,
  }) : super(key: key);
  final double bottomHeight;
  final double horizontalWidth;
  final int totalSteps;
  final int currentStep;
  final TabController tabController;
  final String text;
  final void function;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottomHeight,
        left: horizontalWidth,
        right: horizontalWidth,
        child: Column(
          children: [
            StepProgressIndicator(
              roundedEdges: const Radius.circular(10.0),
              totalSteps: totalSteps,
              currentStep: currentStep,
              selectedColor: AppColors.mainRed,
              unselectedColor: AppColors.culturedGray,
            ),
            const SizedBox(height: 10),
            CustomButton(
              tabController: tabController,
              text: text,
            ),
          ],
        ));
  }
}
