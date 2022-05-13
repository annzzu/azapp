import 'package:flutter/material.dart';

class AppColors {
  ///Application [Text] Styles
  static const largeHeadline = TextStyle(
    fontSize: 28,
    height: 30 / 28,
    fontWeight: FontWeight.w500,
  );
  static const vLargeHeadline = TextStyle(
    fontSize: 36,
    height: 35 / 28,
    fontWeight: FontWeight.normal,
  );

  ///Application [Text] Styles
  static const largeHeadlineSec = TextStyle(
    fontSize: 24,
    height: 30 / 28,
    fontWeight: FontWeight.w500,
  );
  static const headline = TextStyle(
    fontSize: 20,
    height: 16 / 20,
    fontWeight: FontWeight.w500,
  );
  static const smHeadline = TextStyle(
    fontSize: 18,
    height: 16 / 20,
    fontWeight: FontWeight.normal,
  );
  static const subTitle = TextStyle(
    fontSize: 16,
    height: 13 / 16,
    fontWeight: FontWeight.w500,
  );
  static const subText = TextStyle(
    fontSize: 16,
    height: 19 / 16,
    fontWeight: FontWeight.normal,
  );

  ///This style is not in design
  static const smallSubText = TextStyle(
    fontSize: 14,
    height: 17 / 14,
    fontWeight: FontWeight.normal,
  );

  ///This style is not in design
  static const smallerSubText = TextStyle(
    fontSize: 10,
    height: 12 / 10,
    fontWeight: FontWeight.normal,
  );
  static const inputPlaceholderActive = TextStyle(
    fontSize: 16,
    height: 19 / 16,
    fontWeight: FontWeight.bold,
  );
  static const actionDateSubtext = TextStyle(
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w400,
  );
  static const bodyText = TextStyle(
    fontSize: 14,
    height: 17 / 14,
    fontWeight: FontWeight.normal,
  );
  static const progressText = TextStyle(
    fontSize: 14,
    height: 17 / 14,
    fontWeight: FontWeight.bold,
  );

  /// Application [Color] theme
  /// [darkPurple] & [whiteColor] were not displayed on figma board
  ///
  static const primaryColor = Color(0xFF2B2E4A);
  static const mediumPurple = Color.fromRGBO(166, 116, 252, 1);
  static const darkPurple = Color.fromRGBO(76, 56, 111, 1);
  static const aliceBlue = Color.fromRGBO(233, 242, 255, 1);
  static const smokyBlack = Color.fromRGBO(17, 17, 17, 1);
  static const quickSilverGray = Color.fromRGBO(166, 166, 166, 1);
  static const platinumGray = Color.fromRGBO(232, 232, 232, 1);
  static const culturedGray = Color.fromRGBO(242, 242, 242, 1);
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const seaGreenCrayola = Color.fromRGBO(88, 244, 188, 1);
  static const scarletRed = Color.fromRGBO(245, 92, 61, 1);
  static const mainRed = Color.fromRGBO(135, 35, 18, 1.0);
  static const lightBlue = Color.fromRGBO(233, 242, 255, 1);

  /// Application [Gradient] colors
  static const sliderGradient = LinearGradient(colors: [
    Color.fromRGBO(233, 242, 255, 1),
    Color.fromRGBO(244, 240, 255, 1),
  ]);

  static const userPhotoGradient = LinearGradient(colors: [
    Color.fromARGB(200, 0, 0, 0),
    Color.fromARGB(0, 0, 0, 0)
  ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,);

  /// Application [Gradient] colors
  static const mainGradient = LinearGradient(colors: [
    Color.fromRGBO(166, 116, 252, 1),
    Color.fromRGBO(76, 56, 111, 1),
  ]);
  static const redGradient = LinearGradient(
    colors: [
      Color.fromARGB(200, 0, 0, 0),
      Color.fromRGBO(245, 92, 61, 1),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const userCardGradient = LinearGradient(
    colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  /// [RP]-App overall theme
  static ThemeData applicationTheme() {
    return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    );
  }
}
