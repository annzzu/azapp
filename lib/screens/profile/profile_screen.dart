import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/widgets/widgets/nodes/photo_node.dart';
import 'package:flutter/material.dart';

import '../../models/models/user_model.dart';
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
      appBar: const CustomAppBar(
        title: 'AZapp',
        textColor: AppColors.mainRed,
      ),
      extendBodyBehindAppBar: false,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.imageUrls[0]),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      user.name,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              )
            ],
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
                      return ChoiceChip(
                        label: Text(
                          user.interests[idx],
                          style: AppColors.bodyText
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        selected: false,
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
