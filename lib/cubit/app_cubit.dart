import 'package:adventure_travel_app/cubit/app_cubit_states.dart';
import 'package:adventure_travel_app/models/data_model.dart';
import 'package:adventure_travel_app/services/data_services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class AppCubit extends Cubit<CUbitState> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      print("placesfffff: $places ");
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailState(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
