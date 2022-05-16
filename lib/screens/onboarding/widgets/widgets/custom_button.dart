import 'package:azapp/config/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:azapp/blocs/blocs.dart';
import 'package:azapp/cubits/singup/signup_cubit.dart';
import 'package:azapp/models/models.dart' as models;

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
    this.emailController,
    this.passwordController,
    this.function,
  }) : super(key: key);
  final TabController tabController;
  final String text;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final void function;

  userAdded(BuildContext context, UserCredential value) {
    print("User Added");
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 1,
        content: Text('User Added: ${value.user?.email}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: AppColors.redGradient,
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (tabController.index == 5) {
            Navigator.pushNamed(context, '/');
          } else {
            tabController.animateTo(tabController.index + 1);
          }
          if (tabController.index == 2) {
            await context.read<SignupCubit>().signUpWithCredentials();
            print("status ${context.read<SignupCubit>().state.status}");

            String? uid = context.read<SignupCubit>().state.user!.uid;
            print("status paroli $uid");
            models.User user = models.User(
              id: uid,
              name: '',
              age: 0,
              gender: '',
              imageUrls: [],
              jobTitle: '',
              interests: [],
              bio: '',
              location: '',
            );
            context.read<OnBoardingBloc>().add(
                  StartOnBoarding(
                    user: user,
                  ),
                );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: AppColors.smHeadline.copyWith(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
// switchCases(BuildContext context, dynamic onError) {
//   String errorMessage = 'Failed to Add User';
//   if (onError is FirebaseAuthException)
//   switch (onError.code) {
//     case "email-already-in-use":
//       errorMessage = onError.message;
//       break;
//     case "ERROR_INVALID_EMAIL":
//       errorMessage = "Your email address appears to be malformed.";
//       break;
//     case "ERROR_WRONG_PASSWORD":
//       errorMessage = "Your password is wrong.";
//       break;
//     case "ERROR_USER_NOT_FOUND":
//       errorMessage = "User with this email doesn't exist.";
//       break;
//     case "ERROR_USER_DISABLED":
//       errorMessage = "User with this email has been disabled.";
//       break;
//     case "ERROR_TOO_MANY_REQUESTS":
//       errorMessage = "Too many requests. Try again later.";
//       break;
//     case "ERROR_OPERATION_NOT_ALLOWED":
//       errorMessage = "Signing in with Email and Password is not enabled.";
//       break;
//     default:
//       errorMessage = errorMessage;
//   }
//   print(onError.code);
//   print(onError);
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     elevation: 1,
//     content: Text(errorMessage),
//   ));
// }
// if (emailController != null && passwordController != null) {
//   // await FirebaseAuth.instance
//   //     .createUserWithEmailAndPassword(
//   //       email: emailController!.text,
//   //       password: passwordController!.text,
//   //     )
//   //     .then((value) => userAdded(context, value))
//   // .catchError((e)=> print('failed'));
//   // await FirebaseAuth.instance
//   //     .createUserWithEmailAndPassword(
//   //   email: emailController!.text,
//   //   password: passwordController!.text,
//   // )
//   //     .then((value) {
//   //   print("User Added");
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(
//   //       elevation: 1,
//   //       content: Text('User Added: ${value.user?.email}'),
//   //     ),
//   //   );
//   // }).catchError((signUpError) {
//   //   if (signUpError.code == 'email-already-in-use') {
//   //     print("უკვე დარეგისტრირებული");
//   //   } else {
//   //     print("Failed to Add User");
//   //   }
//   // });
// }
