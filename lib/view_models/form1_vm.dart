import 'package:flutter/cupertino.dart';

import '../models/form1_model.dart';

class FirstPageViewModel extends ChangeNotifier {
  String? city;

  List<String> cities = [
    'Chennai',
    'Rajasthan',
    'Bengaluru',
    'MP',
    'Vadodara'
  ];

  UserModel user = UserModel();

  UserModel get formData => user;


  bool isFormValid() {
    return user.name != null &&
        user.email != null &&
        user.phone != null &&
        city != null;
  }

  void setName(String? name) {
    user.name = name;
    notifyListeners();
  }

  void setEmail(String? email) {
    user.email = email;
    notifyListeners();
  }

  void setPhone(String? phone) {
    user.phone = phone;
    notifyListeners();
  }

  void setCity(String? city) {
    this.city = city;
    user.city = city; // Set value for city property in user model
    notifyListeners();
  }
}
