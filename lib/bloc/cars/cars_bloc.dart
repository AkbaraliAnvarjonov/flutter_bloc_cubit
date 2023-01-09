import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/cars/car_event.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:flutter_bloc_cubit/data/models/my_response.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc(this.carsRepos) : super(InitialCarsState()) {
    on<FetchCarsList>(_fetchAllCars);
  }

  final CarsRepos carsRepos;

  _fetchAllCars(FetchCarsList event, Emitter<CarsState> emit) async {
    emit(LoadCarsInProgress());
    MyResponse myResponse = await carsRepos.getAllCars();
    if (myResponse.error.isEmpty) {
      emit(LoadCarsInSuccess(albums: myResponse.data));
    } else {
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }
}
