import 'package:flutter/material.dart';

class TitleWithIconRow extends StatelessWidget {
  const TitleWithIconRow({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .headline3,
        ),
        IconButton(icon: Icon(icon), onPressed: () {})
      ],
    );
  }
}
