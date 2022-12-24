import 'package:adventure_travel_app/cubit/app_cubit.dart';
import 'package:adventure_travel_app/misc/colors.dart';
import 'package:adventure_travel_app/widgets/app_large_text.dart';
import 'package:adventure_travel_app/widgets/responsive_button.dart';
import 'package:adventure_travel_app/widgets/text.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 150,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Ex ad sit irure fugiat culpa nulla mollit elit amet sit labore mollit dolore enim.",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: (() {
                            BlocProvider.of<AppCubit>(context).getData();
                          }),
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(
                                  width: 110,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDot) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: 2,
                          ),
                          width: 8,
                          height: index == indexDot ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDot
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
