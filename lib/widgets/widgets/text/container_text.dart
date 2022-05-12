import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final dynamic text;
  // ContainerText(text:interest)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 5.0, right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: AppColors.redGradient,
      ),
      child: Text(
        text,
        style: AppColors.bodyText.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
