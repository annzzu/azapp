import 'package:azapp/widgets/widgets/text/small_text.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 60;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: 16,
              color: AppColors.smokyBlack,
              height: 1.8,
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SmallText(
                text:
                    hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf),
                size: 16,
                color: AppColors.smokyBlack,
                height: 1.8,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(
                  children: [
                    const SmallText(
                      text: "Show more",
                      color: AppColors.smokyBlack,
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.smokyBlack,
                    )
                  ],
                ),
              )
            ]),
    );
  }
}
