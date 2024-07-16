import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app_flutter_nodejs/common/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:ecommerce_app_flutter_nodejs/Constant/error_handling.dart';
import 'package:ecommerce_app_flutter_nodejs/Constant/global_veriable.dart';
import 'package:ecommerce_app_flutter_nodejs/Constant/utils.dart';
import 'package:ecommerce_app_flutter_nodejs/models/user.dart';
import 'package:ecommerce_app_flutter_nodejs/provider/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            BottomBar.routeName,
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

  // get data
  void getData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('jwt-auth-token');

      if (token == null) {
        pref.setString('jwt-auth-token', '');
      }

      final response = await http.get(
        Uri.parse('$uri/'),
        headers: <String, String>{
          'Content-type': 'application/json; UTF=8',
          'Authorization': 'bearer $token'
        },
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(context, listen: false)
            .setUser(response.body);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      log(e.toString());
      showSnackBar(context: context, message: e.toString());
    }
  }
}
