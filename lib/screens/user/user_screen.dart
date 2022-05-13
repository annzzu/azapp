import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/blocs/swipe/swipe_bloc.dart';
import 'package:azapp/models/models.dart';
import 'package:azapp/widgets/widgets.dart';

import '../../widgets/widgets/text/container_text.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    Key? key, required this.user
  }) : super(key: key);
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.9,
            child: Stack(
              children: [
                Hero(
                  tag: 'user_card',
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 60,
                    ),
                    child: BlocBuilder<SwipeBloc, SwipeState>(
                      builder: (context, state) {
                        if (state is SwipeLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SwipeLoaded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<SwipeBloc>().add(
                                      SwipeRightEvent(user: state.users[0]));
                                  Navigator.pop(context);
                                  print('Swiped Right');
                                },
                                child: const ChoiceButton(
                                  color: AppColors.scarletRed,
                                  icon: Icons.clear_rounded,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<SwipeBloc>().add(
                                      SwipeRightEvent(user: state.users[0]));
                                  Navigator.pop(context);
                                  print('Swiped Left');
                                },
                                child: const ChoiceButton(
                                  width: 80,
                                  height: 80,
                                  size: 30,
                                  color: Colors.white,
                                  hasGradient: true,
                                  icon: Icons.favorite_rounded,
                                ),
                              ),
                              ChoiceButton(
                                color: Theme.of(context).primaryColor,
                                icon: Icons.watch_later,
                              ),
                            ],
                          );
                        } else {
                          return const Text('Something went wrong.');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.name}, ${user.age}',
                    style: AppColors.largeHeadlineSec),
                const SizedBox(height: 5),
                Text(
                  user.jobTitle,
                  style: AppColors.smHeadline,
                ),
                const SizedBox(height: 15),
                Text('About',
                    style: AppColors.smHeadline.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                Text(user.bio, style: AppColors.bodyText.copyWith(height: 1.5)),
                const SizedBox(height: 20),
                Text('Interests', style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: user.interests.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, idx) {
                        return ContainerText(text: user.interests[idx]);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
