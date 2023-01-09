import 'package:flutter_bloc_cubit/data/api_service/users_api_service.dart';
import 'package:flutter_bloc_cubit/data/models/my_response.dart';

class CarsRepos {
  CarsRepos({required this.apiService});

  final UserApiSerice apiService;

  Future<MyResponse> getAllCars() => apiService.getCarsList();
  Future<MyResponse> getSingleCar({required int id}) =>
      apiService.getCarInfo(id: id);
}
