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

  @override
  Widget build(BuildContext context) {
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
              BlocBuilder<ImagesBloc, ImagesState>(builder: (context, state) {
                if (state is ImagesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ImagesLoaded) {
                  var imageCount = state.imageUrls.length;
                  return Column(
                    children: [
                      Wrap(
                        children: List.generate(
                            6,
                            (idx) => CustomImageContainer(
                                  imgUrl: imageCount > idx
                                      ? state.imageUrls[idx]
                                      : null,
                                )),
                      )
                    ],
                  );
                } else {
                  return const Text('Something went wrong.');
                }
              }),
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
}
