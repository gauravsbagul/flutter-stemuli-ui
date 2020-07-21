import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'screens/AccountSelection.dart';
import 'screens/Login.dart';
import 'screens/dashboard.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'STEMuli',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Splash(),
          routes: {
            AccountSelection.routeName: (ctx) => AccountSelection(),
            Login.routeName: (ctx) => Login(),
            Dashboard.routeName: (ctx) => Dashboard()
          },
        ),
      ),
    );
  }
}
