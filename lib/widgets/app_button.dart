// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adventure_travel_app/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:adventure_travel_app/misc/colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backGroundColor;
  String? text = "";
  IconData? icon;
  double size;
  bool? isIcon;
  Color borderColor;
  AppButton({
    Key? key,
    required this.color,
    required this.backGroundColor,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        color: backGroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
