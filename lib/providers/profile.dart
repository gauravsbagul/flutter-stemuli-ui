import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url = 'https://stemuli-backend-sandbox.azurewebsites.net/api/';

class Profile with ChangeNotifier {
  dynamic _userProfile;
  String token;
  Profile(
    this.token,
    this._userProfile,
  );

  Map<String, Object> get userProfile {
    return _userProfile;
  }

  Future<dynamic> getUserProfile() async {
    try {
      final response = await http.get(url + 'profile',
          headers: {HttpHeaders.authorizationHeader: token});
      final responseData = await json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _userProfile = responseData;

      notifyListeners();

      final res = {'error': false, 'response': _userProfile};

      return res;
    } catch (error) {
      print('ERROR: ${error.toString()}');
      final res = {'error': true, 'response': error};
      return res;
    }
  }
}
