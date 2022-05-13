import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

class CustomTextHeader extends StatelessWidget {
  final String text;

  const CustomTextHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppColors.vLargeHeadline,
    );
  }
}
