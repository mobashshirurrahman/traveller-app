// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adventure_travel_app/misc/colors.dart';
import 'package:adventure_travel_app/widgets/text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double width;

  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppText(text: "Book Now", color: Colors.white))
                : Container(),
            Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}
