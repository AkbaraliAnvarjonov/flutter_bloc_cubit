// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/car_info/car_event.dart';
import 'package:flutter_bloc_cubit/data/models/my_response.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc(this.carsRepos) : super(InitialCarState()) {
    on<FetchCarInfo>(_fetchCarInfo);
  }

  final CarsRepos carsRepos;

  _fetchCarInfo(FetchCarInfo event, Emitter<CarState> emit) async {
    emit(LoadCarInProgress());
    MyResponse myResponse = await carsRepos.getSingleCar(id: event.id);
    if (myResponse.error.isEmpty) {
      emit(LoadCarInSuccess(album: myResponse.data));
    } else {
      emit(LoadCarInFailure(errorText: myResponse.error));
    }
  }
}
