import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/area_calc/area_calc_cubit.dart';
import 'package:flutter_bloc_cubit/bloc/cars/car_event.dart';
import 'package:flutter_bloc_cubit/bloc/cars/cars_bloc.dart';
import 'package:flutter_bloc_cubit/data/api_service/users_api_service.dart';
import 'package:flutter_bloc_cubit/data/repositories/cars_repo.dart';
import 'package:flutter_bloc_cubit/ui/cars_consumer_page/cars_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AreaCalcCubit areaCalcCubit = AreaCalcCubit();

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => CarsRepos(apiService: UserApiSerice()),
          )
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => areaCalcCubit,
          ),
          BlocProvider(
            create: (context) =>
                CarsBloc(context.read<CarsRepos>())..add(FetchCarsList()),
          ),
        ], child: const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const CarsPage(),
    );
  }
}
