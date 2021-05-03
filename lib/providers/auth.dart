import 'dart:convert';

import 'package:designings/helper/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../endpoint.dart';

class Auth with ChangeNotifier {
  String _token;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<bool> authenticate(String email, String password, String api) async {
    final url = Uri.tryParse(API_LIST[api]);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    try {
      final res = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      print(jsonDecode(res.body));
      final result = jsonDecode(res.body);
      if (result['status'] == "success" && result['data']['token'] != null) {
        _token = result['data']['token'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _token);
        print('qqqqqqqqqqqqqqqqqqqqqqqqqq');
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        throw HttpException(result['message']);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> signup(String email, String password) async {
    return authenticate(email, password, 'SIGNUP');
  }

  Future<bool> signin(String email, String password) async {
    return authenticate(email, password, 'SIGNIN');
  }

  Future<void> logout() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      print('here');
      _token = null;
      // notifyListeners();
      return false;
    }

    _token = prefs.getString('token');
    print('-------------here-------------');
    // notifyListeners();
    return true;
  }
}
