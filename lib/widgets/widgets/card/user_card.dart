import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:azapp/models/models.dart';
import 'package:azapp/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'user_card',
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.imageUrls[0]),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(3, 3),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: AppColors.userPhotoGradient,
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.age}',
                      style: AppColors.largeHeadline.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.jobTitle,
                      style: AppColors.headline.copyWith(
                          color: Colors.white,
                          height: 1.4,
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            4,
                            (index) =>
                                UserImageSmall(url: user.imageUrls[index]),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.info_rounded,
                          size: 25,
                          color: AppColors.whiteColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
