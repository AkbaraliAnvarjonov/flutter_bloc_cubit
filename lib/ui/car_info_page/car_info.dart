// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/car_info/car_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/car_info/car_event.dart';
import 'package:flutter_bloc_cubit/bloc/car_info/car_state.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';
import 'package:flutter_bloc_cubit/utils/my_utils.dart';

class CarInfo extends StatelessWidget {
  int id;
  CarInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarBloc>(
      create: (context) =>
          CarBloc(context.read<CarsRepos>())..add(FetchCarInfo(id: id)),
      child: Scaffold(
        appBar: AppBar(title: const Text("Single Car Info")),
        body: BlocConsumer<CarBloc, CarState>(
          listenWhen: (previous, current) => current is LoadCarInProgress,
          builder: (context, state) {
            if (state is InitialCarState) {
              return const Text("Hali data yo'q");
            } else if (state is LoadCarInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCarInSuccess) {
              return ListTile(
                title: Text(state.album.carModel),
              );
            } else if (state is LoadCarInFailure) {
              return Text(state.errorText);
            } else {
              return const SizedBox();
            }
          },
          
          listener: (context, state) {
            if (state is LoadCarInProgress) {
              MyUtils.getMyToast(message: "Loading in progress...");
            } else if (state is LoadCarInSuccess) {
              MyUtils.getMyToast(message: "Success data");
            }
          },
        ),
      ),
    );
  }
}
