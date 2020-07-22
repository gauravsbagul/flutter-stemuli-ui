import 'package:STEMuli/providers/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'screens/AccountSelection.dart';
import 'screens/Login.dart';
import 'screens/DashboardScreen.dart';
import 'screens/splash.dart';
import 'style/color.dart';

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
        ChangeNotifierProxyProvider<Auth, Dashboard>(
          update: (ctx, auth, prevDashboard) => Dashboard(
            auth.token,
            prevDashboard,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'STEMuli',
          theme: ThemeData(
            accentColor: Colors.blueAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: HexColor('#3F51B5'),
            fontFamily: 'Muli',
            iconTheme: new IconThemeData(
              color: HexColor('#3F51B5'),
            ),
          ),
          home: Splash(),
          routes: {
            AccountSelection.routeName: (ctx) => AccountSelection(),
            Login.routeName: (ctx) => Login(),
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
          },
        ),
      ),
    );
  }
}
