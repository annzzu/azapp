import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/blocs/swipe/swipe_bloc.dart';
import 'package:azapp/config/app_router.dart';
import 'package:azapp/screens/screens.dart';

import 'config/theme.dart';
import 'models/models.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()
            ..add(
              LoadUsersEvent(users: User.users),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'AZApp',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MatchesScreen.routeName,
      ),
    );
  }
}
