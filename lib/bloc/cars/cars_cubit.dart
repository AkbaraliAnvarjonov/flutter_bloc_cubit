import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:flutter_bloc_cubit/data/models/my_response.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit(this.carsRepos) : super(InitialCarsState()) {
    fetchAllCars();
  }

  final CarsRepos carsRepos;

  fetchAllCars() async {
    emit(LoadCarsInProgress());
    MyResponse myResponse = await carsRepos.getAllCars();
    if (myResponse.error.isEmpty) {
      emit(LoadCarsInSuccess(albums: myResponse.data));
    } else {
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }
}
