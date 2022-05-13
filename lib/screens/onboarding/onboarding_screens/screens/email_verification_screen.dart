import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';

import '../../../../utils/size_helper.dart';
import '../../widgets/widgets/positioned_button.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({
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
              CustomTextHeader(text: 'Did You Get the Verification Code?'),
              CustomTextField(hint: 'ENTER YOUR CODE'),
            ]),
        PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 2,
            tabController: tabController)
      ],
    );
  }
}
