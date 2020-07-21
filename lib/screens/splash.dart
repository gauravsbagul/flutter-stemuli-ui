import 'package:STEMuli/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:STEMuli/providers/auth.dart';

import 'AccountSelection.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void navigate() async {
    print('NAVIGATE:');
    var isLoggedIn =
        await Provider.of<Auth>(context, listen: false).tyrAutoLogin();

    print('isLoggedIn: ${isLoggedIn['isExpire']}');
    new Future.delayed(const Duration(seconds: 3));
    if (isLoggedIn['isExpire']) {
      print('ISLOGGEDIN[ISEXPIRE]: ${isLoggedIn['isExpire']}');
      Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(AccountSelection.routeName);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
