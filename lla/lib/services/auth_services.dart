import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lla/features/auth/presentation/pages/signup_page.dart';
import 'package:lla/features/dashboard/pages/home_page.dart';
import 'package:lla/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:lla/providers/user_provider.dart';
import 'package:lla/utils/constants.dart';
import 'package:lla/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String username,
      required String email,
      required String password}) async {
    try {
      User user = User(
          username: username,
          email: email,
          password: password,
          token: '',
          id: '');

      http.Response response =
          await http.post(Uri.parse('${Constansts.baseUrl}/users/register'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: user.toJson());

      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account Created Successfully', Colors.green);
          });
    } catch (e) {
             showSnackBar(context, e.toString(), Colors.red);

    }
  }

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response response =
          await http.post(Uri.parse('${Constansts.baseUrl}/users/login'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({'email': email, 'password': password}));

      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            userProvider.setUser(response.body);
            await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage()
              ),
              (route) => false
            );
            showSnackBar(context, 'Login Successful', Colors.green);
          });
    } catch (e) {
             showSnackBar(context, e.toString(), Colors.red);

    }
  }

   void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.get(
        Uri.parse('${Constansts.baseUrl}/users/get-my-profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );


      userProvider.setUser(tokenRes.body);

      
    } catch (e) {
      print(e.toString());
    }
  }


void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
      (route) => false,
    );
  }


  
}
