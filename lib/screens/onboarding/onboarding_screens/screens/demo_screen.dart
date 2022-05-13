import 'package:azapp/screens/onboarding/widgets/widgets/positioned_button.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';

import '../../../../utils/size_helper.dart';

class Demo extends StatelessWidget {
  const Demo({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;



  @override
  Widget build(BuildContext context) {
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
              CustomTextHeader(text: 'What\'s Your Gender?'),
              SizedBox(height: 20),
              CustomCheckbox(text: 'MALE'),
              CustomCheckbox(text: 'FEMALE'),
              SizedBox(height: 20),
              CustomTextHeader(text: 'What\'s Your Age?'),
              CustomTextField(hint: 'ENTER YOUR AGE'),
            ]),
        PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 3,
            tabController: tabController)
      ],
    );
  }
}
