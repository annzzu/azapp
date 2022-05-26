import 'package:azapp/config/theme/app_colors.dart';
import 'package:azapp/screens/onboarding/widgets/widgets/custom_image_container.dart';
import 'package:azapp/widgets/widgets/nodes/photo_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../models/models/user_model.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../widgets/widgets.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          print(BlocProvider.of<AuthBloc>(context).state);

          return BlocProvider.of<AuthBloc>(context).state.status ==
              AuthStatus.unauthenticated
              ? LoginScreen()
              : ProfileScreen();
        });
  }

  profile(BuildContext context, ProfileLoaded state) {
    User user = state.user;
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
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
                user.name.isNotEmpty ? user.name :  'test user' ,
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
                user.location.isNotEmpty ? user.location : 'Singapore, 1 Shenton Way',
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
                          user.interests[idx].toString(),
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
              TextButton(
                onPressed: () {
                  RepositoryProvider.of<AuthRepository>(context)
                      .signOut();
                },
                child: Center(
                  child: Text(
                    'Sign Out',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainRed,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.whiteColor,
          )),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return profile(context, state);
          } else {
            return Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
