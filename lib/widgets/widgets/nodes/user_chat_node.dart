import 'package:azapp/config/route_helper.dart';
import 'package:azapp/models/models.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
import '../image/user_image_small.dart';

class UserChatNode extends StatelessWidget {
  const UserChatNode({
    Key? key,
    required this.userMatch,
    this.size = 70.0,
  }) : super(key: key);
  final UserMatch userMatch;
  final double size;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteHelper.chat,
            arguments: userMatch);
      },
      child: Row(
        children: [
          UserImageSmall(
            height: size,
            width: size,
            url: userMatch.matchedUser.imageUrls[0],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userMatch.matchedUser.name,
                style: AppColors.subText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                userMatch.chat!.last.messages.last.message,
                style: AppColors.subText,
              ),
              const SizedBox(height: 5),
              Text(
                userMatch.chat!.last.messages.last.timeString,
                style: AppColors.smallerSubText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
