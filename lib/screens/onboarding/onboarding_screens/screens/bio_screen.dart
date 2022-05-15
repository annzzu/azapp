import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/size_helper.dart';
import '../../widgets/widgets/positioned_button.dart';

class Bio extends StatelessWidget {
  const Bio({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    List<String> firstList = [
      'MUSIC',
      'ECONOMICS',
      'POLITICS',
      'ART',
      'NATURE',
      'HIKING',
      'FOOTBALL',
      'MOVIES'
    ];
    return Stack(
      children: [
        ListView(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
              bottom: 90,
            ),
            children: [
              const CustomTextHeader(text: 'Describe Yourself'),
              const CustomTextField(hint: 'ENTER YOUR BIO'),
              const SizedBox(height: 100),
              const CustomTextHeader(text: 'What Do You Like?'),
              Wrap(
                children: List.generate(
                    firstList.length,
                    (idx) => Padding(
                      padding: EdgeInsets.all(1),
                      child: FilterChip(
                            label: Text(
                              firstList[idx],
                              style: AppColors.bodyText
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            selected: false,
                            onSelected: (bool value) {},
                          ),
                    )),
              ),
            ]),
        PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 5,
            tabController: tabController)
      ],
    );
  }
}
