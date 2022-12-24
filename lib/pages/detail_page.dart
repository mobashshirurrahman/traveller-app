import 'package:adventure_travel_app/cubit/app_cubit.dart';
import 'package:adventure_travel_app/cubit/app_cubit_states.dart';
import 'package:adventure_travel_app/misc/colors.dart';
import 'package:adventure_travel_app/widgets/app_button.dart';
import 'package:adventure_travel_app/widgets/app_large_text.dart';
import 'package:adventure_travel_app/widgets/responsive_button.dart';
import 'package:adventure_travel_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectGroup = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CUbitState>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return WillPopScope(
          onWillPop: (() async {
            return BlocProvider.of<AppCubit>(context).goHome();
          }),
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 3.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detail.place.img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 30,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).goHome();
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detail.place.name,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 30),
                                ),
                                SizedBox(width: 15),
                                AppLargeText(
                                    text: "\$" + detail.place.price.toString(),
                                    color: AppColors.mainColor),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 5),
                              AppText(
                                text: detail.place.location,
                                color: AppColors.mainTextColor,
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: detail.place.stars > index
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              AppText(
                                  text:
                                      "(" + detail.place.stars.toString() + ")",
                                  color: AppColors.textColor2),
                            ],
                          ),
                          SizedBox(height: 22),
                          AppLargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20),
                          AppText(
                              text: "Number of People in group",
                              color: AppColors.mainTextColor),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectGroup = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    color: selectGroup == index
                                        ? Colors.white
                                        : Colors.black,
                                    backGroundColor: selectGroup == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    size: 50,
                                    borderColor: selectGroup == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          AppLargeText(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20),
                          SizedBox(height: 10),
                          AppText(
                            text: detail.place.description,
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          color: AppColors.textColor1,
                          backGroundColor: Colors.white,
                          size: 60,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
