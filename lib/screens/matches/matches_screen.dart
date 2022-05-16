import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../../widgets/widgets/nodes/user_chat_node.dart';
import '../../widgets/widgets/nodes/user_photo_name_node.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const MatchesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Chat'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Likes',
                style: AppColors.headline,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, idx) {
                      return UserPhotoNameNode(
                        userMatch: inactiveMatches[idx],
                      );
                    }),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your Chats',
                style: AppColors.headline,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeMatches.length,
                  itemBuilder: (context, idx) {
                    return UserChatNode(userMatch: activeMatches[idx]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
