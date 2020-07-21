import 'package:STEMuli/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AccountSelection.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';

  void _logout(context) async {
    print('CONTEXT:_logout $context');
    await Provider.of<Auth>(context, listen: false).logout();
    Navigator.of(context).pushReplacementNamed(AccountSelection.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _logout(context),
          child: Text('Logout'),
        ),
      ),
    );
  }
}
