abstract class AreaCalcState {}

class InitialState extends AreaCalcState {
  InitialState({required this.a});

  final int a;
}

class TriangleAreaState extends AreaCalcState {
  TriangleAreaState(this.areaResult);

  num areaResult = 0;
}

class SquareAreaState extends AreaCalcState {
  SquareAreaState(this.areaResult);

  num areaResult = 0;
}

class CircleAreaState extends AreaCalcState {
  CircleAreaState(this.areaResult);

  num areaResult = 0;
}
