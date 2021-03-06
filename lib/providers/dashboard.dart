import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url = 'https://stemuli-backend-sandbox.azurewebsites.net/api/';

class Dashboard with ChangeNotifier {
  dynamic _dashboardData;
  String token;
  Dashboard(
    this.token,
    this._dashboardData,
  );

  dynamic get dashboardData {
    return _dashboardData;
  }

  Future<dynamic> getDashboard() async {
    try {
      final response = await http.get(url + 'dashboard',
          headers: {HttpHeaders.authorizationHeader: token});
      final responseData = await json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _dashboardData = responseData;

      notifyListeners();

      final res = {'error': false, 'response': _dashboardData};

      return res;
    } catch (error) {
      print('ERROR: ${error.toString()}');
      final res = {'error': true, 'response': error};
      return res;
    }
  }
}
