import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_cubit.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:flutter_bloc_cubit/utils/my_utils.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cars Page Consumer")),
      body: BlocConsumer<CarsCubit, CarsState>(
        builder: (context, state) {
          if (state is InitialCarsState) {
            return const Text("Hali data yo'q");
          } else if (state is LoadCarsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadCarsInSuccess) {
            return ListView(
              children: List.generate(
                  state.albums.length,
                  (index) => ListTile(
                        title: Text(state.albums[index].carModel),
                      )),
            );
          } else if (state is LoadCarsInFailure) {
            return Text(state.errorText);
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is LoadCarsInProgress) {
            MyUtils.getMyToast(message: "Loading in progress...");
          }
        },
      ),
    );
  }
}
