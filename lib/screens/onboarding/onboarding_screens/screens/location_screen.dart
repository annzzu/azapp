import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';

import '../../../../utils/size_helper.dart';
import '../../widgets/widgets/positioned_button.dart';

class Location extends StatelessWidget {
  final TabController tabController;

  const Location({
    Key? key,
    required this.tabController,
  }) : super(key: key);

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
              CustomTextHeader(text: 'Where Are You?'),
              CustomTextField(hint: 'ENTER YOUR LOCATION'),
            ]),
        PositionedButton(
          bottomHeight: SizeHelper.calculateSize(
              10, 24, MediaQuery.of(context).size.height * 0.03),
          totalSteps: 6,
          currentStep: 6,
          tabController: tabController,
          text: 'DONE',
        )
      ],
    );
  }
}
