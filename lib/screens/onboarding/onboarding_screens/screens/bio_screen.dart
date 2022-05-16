import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/onboarding/onboarding_bloc.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/size_helper.dart';

class Bio extends StatelessWidget {
  const Bio({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  onBio(BuildContext context, OnBoardingLoaded state) {
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
              CustomTextField(
                  hint: 'ENTER YOUR BIO',
                  onChanged: (value) {
                    context.read<OnBoardingBloc>().add(
                          UpdateUser(
                            user: state.user.copyWith(bio: value),
                          ),
                        );
                  }),
              const SizedBox(height: 100),
              const CustomTextHeader(text: 'What Do You Like?'),
              Wrap(
                children: List.generate(
                    firstList.length,
                    (idx) => Padding(
                          padding: const EdgeInsets.all(1),
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
            ? onBio(context, state)
            : const Center(
                child: Text(
                'Something went wrong.',
                style: AppColors.smHeadline,
              ));
        return loading ?? loaded;
      },
    );
  }
}
