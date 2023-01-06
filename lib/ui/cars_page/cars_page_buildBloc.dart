import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_cubit.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:flutter_bloc_cubit/data/api_service/users_api_service.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';

class CarsPageBlocBuild extends StatelessWidget {
  const CarsPageBlocBuild({super.key});

  @override
  Widget build(BuildContext context) {
    CarsCubit carsCubit = CarsCubit(CarsRepos(apiService: UserApiSerice()));
    return BlocProvider(
      create: (context) => carsCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text("Cars Page BlocBuild")),
        body: BlocBuilder<CarsCubit, CarsState>(
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
        ),
      ),
    );
  }
}
