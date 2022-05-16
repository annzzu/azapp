import 'package:azapp/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/size_helper.dart';

class Location extends StatelessWidget {
  final TabController tabController;

  const Location({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  onLocation(BuildContext context, OnBoardingLoaded state) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
      Widget? loading = state is OnBoardingLoading
          ? const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: CircularProgressIndicator(),
              ),
            )
          : null;
      Widget loaded = state is OnBoardingLoaded
          ? onLocation(context, state)
          : const Center(
              child: Text(
              'Something went wrong.',
              style: AppColors.smHeadline,
            ));

      return loading ?? loaded;
    });
  }
}
