import 'package:adventure_travel_app/cubit/app_cubit_states.dart';
import 'package:adventure_travel_app/cubit/app_cubit.dart';
import 'package:adventure_travel_app/pages/detail_page.dart';
import 'package:adventure_travel_app/pages/home_page.dart';
import 'package:adventure_travel_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CUbitState>(builder: (context, state) {
        if (state is WelcomState) {
          return WelcomePage();
        }
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return HomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
