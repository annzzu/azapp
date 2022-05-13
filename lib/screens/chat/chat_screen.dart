import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/models/models.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.userMatch,
  }) : super(key: key);
  final UserMatch userMatch;
  static const String routeName = '/chat';

  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => ChatScreen(userMatch: userMatch));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              userMatch.matchedUser.name,
              style: AppColors.smHeadline
                  .copyWith(color: AppColors.smokyBlack, height: 18 / 13),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: userMatch.chat != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: userMatch.chat!.last.messages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: userMatch
                                      .chat!.last.messages[index].senderId ==
                                  1
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    child: Text(
                                      userMatch
                                          .chat!.last.messages[index].message,
                                      style: AppColors.bodyText,
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(
                                            userMatch.matchedUser.imageUrls[0]),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Text(
                                          userMatch.chat!.last.messages[index]
                                              .message,
                                          style: AppColors.bodyText.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      })
                  : const SizedBox(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 100,
            child: Column(
              children: [
                const Divider(
                  color: AppColors.primaryColor,
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send_rounded),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: false,
                          fillColor: Colors.white,
                          hintText: 'Type here...',
                          contentPadding:
                              EdgeInsets.only(left: 10, bottom: 2, top: 5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
