import 'package:azapp/config/route_helper.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
    this.textColor,
    this.isTransparent = true,
  }) : super(key: key);
  final String title;
  final bool hasActions;
  final Color? textColor;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isTransparent ? Colors.transparent : AppColors.whiteColor,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.redGradient,
        ),
        child: IconButton(
            color: AppColors.mainRed,
            icon: const Icon(
              Icons.pets_sharp,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, RouteHelper.index);
            }),
      ),
      title: Text(
        title,
        style: AppColors.largeHeadline.copyWith(
          color: textColor ?? AppColors.darkPurple,
          height: 18 / 13,
        ),
      ),
      actions: hasActions
          ? [
              IconButton(
                  icon: const Icon(
                    Icons.messenger_rounded,
                    color: AppColors.darkPurple,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteHelper.matches);
                  }),
              IconButton(
                  icon: const Icon(
                    Icons.person_rounded,
                    color: AppColors.darkPurple,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteHelper.profile);
                  })
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
