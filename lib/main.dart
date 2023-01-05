import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/area_calc/area_calc_cubit.dart';
import 'package:flutter_bloc_cubit/ui/home_page.dart';

void main() {
  AreaCalcCubit areaCalcCubit = AreaCalcCubit();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => areaCalcCubit,
    )
  ], child: const MyApp()));
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
      home: const HomePage(),
    );
  }
}
