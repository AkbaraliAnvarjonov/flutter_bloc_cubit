import 'package:dio/dio.dart';
import 'package:flutter_bloc_cubit/data/api_service/api_client.dart';
import 'package:flutter_bloc_cubit/data/models/car_model.dart';
import 'package:flutter_bloc_cubit/data/models/my_response.dart';

class UserApiSerice extends ApiClient {
  Future<MyResponse> getCarsList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");

      if (response.statusCode == 200) {
        myResponse.data = (response.data["data"] as List)
            .map((e) => CarModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getCarInfo({required int id}) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies/$id");

      if (response.statusCode == 200) {
        myResponse.data = CarModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
