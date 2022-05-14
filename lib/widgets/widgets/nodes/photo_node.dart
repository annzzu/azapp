import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class PhotoNode extends StatelessWidget {
  const PhotoNode({Key? key, required this.imgUrl,}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        height: 125,
        width: 100,
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
