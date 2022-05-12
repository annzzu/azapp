import 'package:azapp/config_ffff/route_helper.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.mainGradient,
        ),
        child: const Icon(
          Icons.pets_sharp,
          color: AppColors.whiteColor,
        ),
      ),
      title: Text(
        title,
        style: AppColors.largeHeadline.copyWith(
          color: AppColors.darkPurple,
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