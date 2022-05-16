import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/config/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/models/models.dart';
import 'package:azapp/widgets/widgets.dart';
import 'package:azapp/blocs/blocs.dart';

import '../onboarding/onboarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          print(BlocProvider
              .of<AuthBloc>(context)
              .state
              .status);
          return BlocProvider
              .of<AuthBloc>(context)
              .state
              .status ==
              AuthStatus.unauthenticated
              ? const OnBoardingScreen()
              : const HomeScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'AZApp'),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            var userCount = state.users.length;
            return Column(
              children: [
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteHelper.users,
                        arguments: state.users[0],
                      );
                    },
                    child: Draggable<User>(
                      data: state.users[0],
                      child: UserCard(user: state.users[0]),
                      feedback: UserCard(user: state.users[0]),
                      childWhenDragging: (userCount > 1)
                          ? UserCard(user: state.users[1])
                          : Container(),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeft(user: state.users[0]));
                          print('Swiped Left');
                        } else {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRight(user: state.users[0]));
                          print('Swiped Right');
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRight(user: state.users[0]));
                          print('Swiped Right');
                        },
                        child: const ChoiceButton(
                          color: AppColors.scarletRed,
                          icon: Icons.clear_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRight(user: state.users[0]));
                          print('Swiped Left');
                        },
                        child: const ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          color: AppColors.whiteColor,
                          hasGradient: true,
                          icon: Icons.favorite_rounded,
                        ),
                      ),
                      const ChoiceButton(
                        color: AppColors.smokyBlack,
                        icon: Icons.watch_later_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }else if (state is SwipeError){
            return Center(
              child: Text('There aren\'t any more users.',
                  style: Theme.of(context).textTheme.headline4),
            );
        } {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}


