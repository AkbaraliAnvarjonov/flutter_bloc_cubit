import 'package:flutter_bloc_cubit/data/models/car_model.dart';

abstract class CarsState {}

class InitialCarsState extends CarsState {}

class LoadCarsInProgress extends CarsState {}

class LoadCarsInSuccess extends CarsState {
  LoadCarsInSuccess({required this.albums});

  final List<CarModel> albums;
}

class LoadCarsInFailure extends CarsState {
  LoadCarsInFailure({required this.errorText});

  final String errorText;
}
