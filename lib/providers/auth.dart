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

  Future tyrAutoLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var result = new Map();
      if (!prefs.containsKey('token')) {
        print('!PREFS.CONTAINSKEY( ): ${!prefs.containsKey('token')}');
        result = {'isExpire': false};
        return result;
      }
      String userTokenValue = prefs.getString('token');

      final tokenResult = parseJwtPayLoad(userTokenValue.split(' ')[1]);

      _token = userTokenValue;
      _expiryDate = DateTime.fromMillisecondsSinceEpoch(
          tokenResult['exp'] * 1000,
          isUtc: true);
      _userObject = tokenResult;

      notifyListeners();
      result = {'isExpire': _expiryDate.isAfter(DateTime.now())};
      return result;
    } catch (error) {
      print('ERROR: $error');
      final result = {'isExpire': false};
      return result;
    }
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
