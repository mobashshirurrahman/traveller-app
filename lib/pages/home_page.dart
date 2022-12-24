// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adventure_travel_app/cubit/app_cubit.dart';
import 'package:adventure_travel_app/cubit/app_cubit_states.dart';
import 'package:adventure_travel_app/misc/colors.dart';
import 'package:adventure_travel_app/pages/detail_page.dart';
import 'package:adventure_travel_app/services/data_services.dart';
import 'package:adventure_travel_app/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:adventure_travel_app/widgets/app_large_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubit, CUbitState>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        // print(info);
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 70,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover")),
                SizedBox(
                  height: 30,
                ),
                // tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      indicator: CircleTabBarIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspire"),
                        Tab(text: "Emotions"),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(left: 20),
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: (() {
                              BlocProvider.of<AppCubit>(context)
                                  .detailState(info[index]);
                            }),
                            child: Container(
                              width: 200,
                              height: 300,
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/" +
                                        info[index].img,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Text("There"),
                      Text("by"),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore More",
                        size: 20,
                      ),
                      AppText(
                        text: "see all",
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          // margin: EdgeInsets.only(right: 25),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                // margin: const EdgeInsets.only(right: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "img/" + images.keys.elementAt(index),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 9),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        );
      } else {
        return Container();
      }
    })
        // body:
        );
  }
}

class CircleTabBarIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabBarIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOfset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOfset, radius, _paint);
  }
}
