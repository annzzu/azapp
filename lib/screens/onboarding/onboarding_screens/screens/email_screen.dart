import 'package:azapp/utils/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/singup/signup_cubit.dart';
import '../../widgets/widgets/positioned_button.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
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
                const CustomTextHeader(text: 'What\'s Your Email Address?'),
                CustomTextField(
                  hint: 'ENTER YOUR EMAIL',
                  onChanged: (value) {
                    context.read<SignupCubit>().emailChanged(value);
                  },
                ),
                const SizedBox(height: 100),
                const CustomTextHeader(text: 'Choose a Password'),
                CustomTextField(
                  hint: 'ENTER YOUR PASSWORD',
                  onChanged: (value) {
                    context.read<SignupCubit>().passwordChanged(value);
                  },
                  obscure: true,
                ),
              ]),
          PositionedButton(
            bottomHeight: SizeHelper.calculateSize(
                10, 24, MediaQuery.of(context).size.height * 0.03),
            totalSteps: 6,
            currentStep: 1,
            tabController: tabController,
          )
        ],
      );
    });
  }
}
