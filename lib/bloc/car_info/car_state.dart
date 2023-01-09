import 'package:flutter_bloc_cubit/data/models/car_model.dart';

abstract class CarState {}

class InitialCarState extends CarState {}

class LoadCarInProgress extends CarState {}

class LoadCarInSuccess extends CarState {
  LoadCarInSuccess({required this.album});

  final CarModel album;
}

class LoadCarInFailure extends CarState {
  LoadCarInFailure({required this.errorText});

  final String errorText;
}
