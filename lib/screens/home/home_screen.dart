import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/config/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/blocs/swipe/swipe_bloc.dart';
import 'package:azapp/models/models.dart';
import 'package:azapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
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
            return Column(
              children: [
                InkWell(
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
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeLeftEvent(user: state.users[0]));
                        print('Swiped Left');
                      } else {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeRightEvent(user: state.users[0]));
                        print('Swiped Right');
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRightEvent(user: state.users[0]));
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
                              .add(SwipeRightEvent(user: state.users[0]));
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
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
