import 'package:azapp/repositories/repositories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/config/app_router.dart';
import 'package:azapp/screens/screens.dart';
import 'config/theme.dart';
import 'cubits/singup/signup_cubit.dart';
import 'models/models.dart';
import 'blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (context) =>
                SignupCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<OnBoardingBloc>(
            create: (context) => OnBoardingBloc(
              databaseRepository: DatabaseRepository(),
              storageRepository: StorageRepository(),
            ),
          ),
          BlocProvider(
            create: (_) => SwipeBloc()
              ..add(
                LoadUsersEvent(
                  users: User.users.where((user) => user.id != 1).toList(),
                ),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'AZApp',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: OnBoardingScreen.routeName,
        ),
      ),
    );
  }
}
