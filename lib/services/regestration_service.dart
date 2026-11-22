import 'package:dio/dio.dart';

import '../models/registration_model.dart';

class RegistrationServices {
  static Dio dio = Dio();

  static Future<RegistrationModel> loginData({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return RegistrationModel.fromJSon(response.data);
    } on DioException catch (dioException) {
      throw Exception("Failed to process login: ${dioException.message}");
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<RegistrationModel> signUpData({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Email": email,
          "Password": password,
          "Phone": phone,
          "Name": name,
        },
      );
      return RegistrationModel.fromJSon(response.data);
    } on DioException catch (dioException) {
      throw Exception("Failed to process Sign up: ${dioException.message}");
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
