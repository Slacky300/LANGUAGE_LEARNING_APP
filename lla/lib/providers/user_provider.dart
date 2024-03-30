import 'package:flutter/material.dart';
import 'package:lla/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(username: '', email: '', password: '', token: '', id: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJsonString(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }


}
