import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app_flutter_nodejs/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecommerce_app_flutter_nodejs/Constant/error_handling.dart';
import 'package:ecommerce_app_flutter_nodejs/Constant/global_veriable.dart';
import 'package:ecommerce_app_flutter_nodejs/Constant/utils.dart';
import 'package:ecommerce_app_flutter_nodejs/models/user.dart';
import 'package:ecommerce_app_flutter_nodejs/provider/user_provider.dart';

class AuthServices {
  // Sign Up User
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$uri/api/sign-up');
      final user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        type: '',
        token: '',
        address: '',
      );

      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );

      httpErrorHandle(
        response: response,
        // ignore: use_build_context_synchronously
        context: context,
        onSuccess: () {
          showSnackBar(
            context: context,
            message: 'Account Created Successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: e.toString(),
      );
    }
  }

  // Sign in

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$uri/api/sign-in');

      final response = await http.post(
        url,
        headers: <String, String>{
          // 'Autherization': 'authtoken',
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      log(response.body);

      httpErrorHandle(
        response: response,
        // ignore: use_build_context_synchronously
        context: context,
        onSuccess: () async {
          showSnackBar(context: context, message: 'Login Successful!');

          SharedPreferences pref = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          pref.setString('jwt-auth-token', jsonDecode(response.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: e.toString(),
      );
    }
  }
}
