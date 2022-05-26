import 'dart:async';
import 'package:azapp/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azapp/blocs/blocs.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../login/login_screen.dart';
import '/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print("Listener");
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushNamed(
                LoginScreen.routeName,
                // ModalRoute.withName('/login'),
              ),
            );
          } else if (state.status == AuthStatus.authenticated) {
            print("has autentication");
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushNamed(HomeScreen.routeName),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/ic_launcher.png')),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'AZAPP',
                  style: AppColors.headline,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
