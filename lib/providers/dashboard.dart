//To Get the User dashboard
// export const _getUserDashboard = () => {
// 	return (dispatch, getState) => {
// 		const { userToken } = getState().userProfile;
// 		new Promise(async (resolve, reject) => {
// 			const body = {
// 				method: 'GET',
// 				url: API.API_AZURE + API_GET_USER_DASHBOARD,
// 				headers: {
// 					Authorization: userToken,
// 				},
// 			};
// 			axios(body)
// 				.then((response) => {
// 					dispatch({
// 						type: 'GET_USER_DASHBOARD',
// 						payload: { response: response.data, error: false },
// 					});
// 				})
// 				.catch((error) => {
// 					Firebase.RNFCrashlytics.setAttribute(API_GET_USER_DASHBOARD, String(error?.response)),
// 						dispatch({
// 							type: 'GET_USER_DASHBOARD',
// 							payload: { response: error?.response, error: true },
// 						});
// 				});
// 		});
// 	};
// };

import 'dart:convert';
import 'dart:async';
import 'dart:io';

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
  Future<dynamic> getDashboard() async {
    try {
      final response = await http.get(url + 'dashboard',
          headers: {HttpHeaders.authorizationHeader: token});
      final responseData = await json.decode(response.body);
      print('RESPONSEDATA: $responseData');

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
