import 'package:azapp/models/models.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
import '../image/user_image_small.dart';

class UserPhotoNameNode extends StatelessWidget {
  const UserPhotoNameNode({
    Key? key,
    required this.userMatch,
    this.size = 70.0,
  }) : super(key: key);
  final UserMatch userMatch;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserImageSmall(
          height: size,
          width: size,
          url: userMatch.matchedUser.imageUrls.first,
        ),
        Text(
          userMatch.matchedUser.name,
          style: AppColors.subText,
        ),
      ],
    );
  }
}
