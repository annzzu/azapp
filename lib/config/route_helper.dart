import 'package:azapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static String index = "/";
  static String home = "/home";
  static String users = "/users";
  static String matches = "/matches";
  static String profile = "/profile";
  static String chat = "/chat";

  static Map<String, WidgetBuilder> routes() => {
    home: (_) =>  const HomeScreen(),
  };
}
