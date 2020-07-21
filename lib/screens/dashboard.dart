import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
