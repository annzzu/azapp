import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/size_helper.dart';
import '../../widgets/widgets.dart';

class Demo extends StatelessWidget {
  const Demo({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  onLoadedUser(BuildContext context, OnBoardingLoaded state) {
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
              const CustomTextHeader(text: 'What\'s Your Gender?'),
              const SizedBox(height: 20),
              CustomCheckbox(
                  text: 'MALE',
                  value: state.user.gender == 'Male',
                  onChanged: (bool? newValue) {
                    context.read<OnBoardingBloc>().add(
                          UpdateUser(
                            user: state.user.copyWith(gender: 'Male'),
                          ),
                        );
                  }),
              CustomCheckbox(
                  text: 'FEMALE',
                  value: state.user.gender == 'Female',
                  onChanged: (bool? newValue) {
                    context.read<OnBoardingBloc>().add(
                          UpdateUser(
                            user: state.user.copyWith(gender: 'Female'),
                          ),
                        );
                  }),
              // CustomCheckbox(text: 'FEMALE'),
              const SizedBox(height: 20),
              const CustomTextHeader(text: 'What\'s Your Age?'),
              const CustomTextField(hint: 'ENTER YOUR AGE'),
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
          ? onLoadedUser(context, state)
          : const Center(
              child: Text(
              'Something went wrong.',
              style: AppColors.smHeadline,
            ));

      return loading ?? loaded;
    });
  }
}
