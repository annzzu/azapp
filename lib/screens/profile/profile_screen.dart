import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/screens/onboarding/widgets/widgets/custom_image_container.dart';
import 'package:azapp/widgets/widgets/nodes/photo_node.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = User.users.first;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainRed,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.whiteColor,
          )),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
                gradient: AppColors.redGradient),
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height / 12,
                  backgroundImage: NetworkImage(user.imageUrls[0]),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  user.name,
                  style: AppColors.headline
                      .copyWith(color: AppColors.whiteColor, height: 18 / 13),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithIconRow(title: 'Biography', icon: Icons.edit),
                ExpandableTextWidget(
                  text: user.bio,
                ),
                const SizedBox(height: 10),
                const TitleWithIconRow(title: 'Pictures', icon: Icons.edit),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: user.imageUrls.length,
                    itemBuilder: (context, idx) {
                      return PhotoNode(imgUrl: user.imageUrls[idx]);
                    },
                  ),
                ),
                const TitleWithIconRow(title: 'Location', icon: Icons.edit),
                Text(
                  'Singapore, 1 Shenton Way',
                  style: AppColors.bodyText.copyWith(height: 1.5),
                ),
                const TitleWithIconRow(title: 'Interests', icon: Icons.edit),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: user.interests.length,
                    itemBuilder: (context, idx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: FilterChip(
                          label: Text(
                            user.interests[idx],
                            style: AppColors.bodyText
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          selected: true,
                          onSelected: (bool value) {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
