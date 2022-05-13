import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: AppColors.redGradient,
      ),
      child: ElevatedButton(
        onPressed: () {
          tabController.animateTo(tabController.index + 1);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: AppColors.smHeadline.copyWith(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
