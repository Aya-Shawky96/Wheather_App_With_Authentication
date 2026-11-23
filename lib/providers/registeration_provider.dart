import 'package:flutter/material.dart';
import '../models/registration_model.dart';
import '../services/regestration_service.dart';

class RegistrationProvider extends ChangeNotifier {
  RegistrationModel? registrationModel;

  Future<bool> loginDataProvider({
    required String email,
    required String password,
  }) async {
    final temp = await RegistrationServices.loginData(
      email: email,
      password: password,
    );
    registrationModel = temp;

    return temp.status;
  }

  Future<bool> signUpDataProvider({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final temp = await RegistrationServices.signUpData(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    registrationModel = temp;

    return temp.status;
  }
}
