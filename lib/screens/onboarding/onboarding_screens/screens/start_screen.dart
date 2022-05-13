import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:azapp/screens/onboarding/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Icon(
                Icons.pets_rounded,
                size: 200,
                color: AppColors.mainRed,
              ),
              const SizedBox(height: 50),
              Text('Welcome to AZAPP',
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(height: 20),
              Text(
                'AZAPP For your lovely pet.',
                style: AppColors.smHeadline.copyWith(height: 1.8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          CustomButton(tabController: tabController, text: 'START')
        ],
      ),
    );
  }
}
