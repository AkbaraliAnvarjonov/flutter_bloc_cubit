import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/area_calc/area_calc_state.dart';

class AreaCalcCubit extends Cubit<AreaCalcState> {
  AreaCalcCubit() : super(InitialState(a: 0));

  circleArea(num a) {
    emit(CircleAreaState(3.14 * a * a));
  }

  triangleArea(num a) {
    emit(TriangleAreaState(a * a * sqrt(3) / 4));
  }

  squareArea(num a) {
    emit(SquareAreaState(a * a));
  }
}
