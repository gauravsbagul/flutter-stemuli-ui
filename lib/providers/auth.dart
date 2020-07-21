import 'dart:convert';
import 'dart:async';

import 'package:STEMuli/actions/tokenDecoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://stemuli-backend-sandbox.azurewebsites.net/api/user/login';

class Auth with ChangeNotifier {
  String _token;
  dynamic _expiryDate;
  Map<String, dynamic> _userObject;

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

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _token = responseData['token'];

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();

      prefs.setString('token', _token);
      // JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      // String prettyprint = encoder.convert(json.decode(response.body));

      final res = {'error': false, 'response': _token};

      return res;
    } catch (error) {
      print('ERROR: $error');
      final res = {'error': true, 'response': error};

      return res;
    }
  }

  Future<bool> tyrAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('token')) {
      return false;
    }
    String userTokenValue = prefs.getString('token');

    final Map<String, dynamic> tokenResult =
        parseJwtPayLoad(userTokenValue.split(' ')[1]);
    print('TOKENRESULT: $tokenResult');

    _token = userTokenValue;
    _expiryDate = tokenResult['exp'];
    _userObject = tokenResult;

    notifyListeners();
    return true;
  }
}
