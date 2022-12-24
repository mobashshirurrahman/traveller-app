import 'package:adventure_travel_app/cubit/app_cubit_logics.dart';
import 'package:adventure_travel_app/cubit/app_cubit.dart';
import 'package:adventure_travel_app/pages/detail_page.dart';
import 'package:adventure_travel_app/pages/home_page.dart';
import 'package:adventure_travel_app/pages/nav_pages/main_page.dart';
import 'package:adventure_travel_app/pages/welcome_page.dart';
import 'package:adventure_travel_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Traveller App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(data: DataServices()),
        child: AppCubitLogic(),
      ),
    );
  }
}
