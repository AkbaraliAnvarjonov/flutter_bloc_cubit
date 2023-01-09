abstract class CarEvent {}

class FetchCarInfo extends CarEvent {
  FetchCarInfo({required this.id});

  final int id;
}
