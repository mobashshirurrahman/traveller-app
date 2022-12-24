// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

import 'package:adventure_travel_app/models/data_model.dart';

abstract class CUbitState extends Equatable {}

class InitialState extends CUbitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomState extends CUbitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CUbitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CUbitState {
  LoadedState(
    this.places,
  );
  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class DetailState extends CUbitState {
  DetailState(
    this.place,
  );
  final DataModel place;

  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
