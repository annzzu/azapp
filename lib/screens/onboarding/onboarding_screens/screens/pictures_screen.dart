import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../utils/size_helper.dart';
import '../../widgets/widgets/positioned_button.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  displayPictures(BuildContext context, List<dynamic> images) {
    return Column(
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
                              imgUrl: images.length > idx ? images[idx] : null,
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

  onBoardingLoaded(BuildContext context, OnBoardingLoaded state) =>
      displayPictures(context, state.user.imageUrls);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
      return Stack(
        children: [
          state is OnBoardingLoaded
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 70),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
          state is OnBoardingLoaded
              ? onBoardingLoaded(context, state)
              : const Center(
                  child: Text(
                  'Something went wrong.',
                  style: AppColors.smHeadline,
                ))
        ],
      );
    });
  }
}
