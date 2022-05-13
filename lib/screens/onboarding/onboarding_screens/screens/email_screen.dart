import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/utils/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widgets/widgets/positioned_button.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  newBuilder(BuildContext context) {
    return Stack(
      children: [
        ListView(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
              bottom: 90,
            ),
            children: const [
              CustomTextHeader(text: 'What\'s Your Email Address?'),
              CustomTextField(hint: 'ENTER YOUR EMAIL'),
            ]),
        PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 1,
            tabController: tabController)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return newBuilder(context);
  }
}
