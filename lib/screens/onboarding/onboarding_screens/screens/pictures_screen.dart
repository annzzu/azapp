import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/size_helper.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  onLoadedUserPictures(
    BuildContext context,
    OnBoardingLoaded state,
  ) {
    return Stack(
      children: [
        ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
              bottom: 90,
            ),
            children: [
              const CustomTextHeader(text: 'Add 4 or More Pictures'),
              const SizedBox(height: 20),
              Column(
                children: [
                  Wrap(
                    children: List.generate(
                        6,
                        (idx) => CustomImageContainer(
                              imgUrl: state.user.imageUrls.length > idx
                                  ? state.user.imageUrls[idx]
                                  : null,
                            )),
                  )
                ],
              )
            ]),
        PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 4,
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
          ? onLoadedUserPictures(context, state)
          : const Center(
              child: Text(
              'Something went wrong.',
              style: AppColors.smHeadline,
            ));
      return loading ?? loaded;
    });
  }
}
