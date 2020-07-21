import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://stemuli-backend-sandbox.azurewebsites.net/api/user/login';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<dynamic> authenticateUser(
    String email,
    String password,
  ) async {
    print('STRING EMAIL:authenticateUser $email');
    print('PASSWORD:authenticateUser $password');
    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );
      final responseData = await json.decode(response.body);
      print('RESPONSEDATA: $responseData');
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }
      print('RESPONSEDATA[token]: ${responseData['token']}');
      _token = responseData['token'];

      notifyListeners();

      // final prefs = await SharedPreferences.getInstance();
      // final userToken = json.encode({
      //   'token': _token,
      // });

      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(json.decode(response.body));
      print('PRETTYPRINT: $prettyprint');
      final res = {'error': false, 'response': _token};
      print('RES: $res');
      return res;
    } catch (error) {
      print('ERROR: $error');
      final res = {'error': true, 'response': error};
      print('RES: $res');
      return res;
    }
  }

  Future<bool> tyrAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userToken')) {
      return false;
    }
    final extractedUserToken =
        json.decode(prefs.getString('userToken')) as Map<String, Object>;

    final expiryDate = DateTime.parse(extractedUserToken['expiryDate']);
    print('EXPIRYDATE: $expiryDate');
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _token = extractedUserToken['token'];
    print('_TOKEN: $_token');
    notifyListeners();
    return true;
  }
}
