import 'package:STEMuli/providers/auth.dart';
import 'package:STEMuli/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:STEMuli/widgets/onBoarding/OnBoardingContainer.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  bool loader = false;

  void _login() async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return;
    }
    setState(() {
      loader = true;
    });
    final res =
        await Provider.of<Auth>(context, listen: false).authenticateUser(
      email,
      password,
    );
    print('RESPONSE: $res');
    if (!res['error'] && res['response'].toString().isNotEmpty) {
      setState(() {
        loader = false;
      });
      Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
    } else {
      setState(() {
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments;
    return OnBoardingContainer(
      title: 'Sign In',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome back',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 23),
            child: Text(
              'Sign in as a $title',
              style: TextStyle(
                color: Color(0x7A424B4B),
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff0d47a1),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
          Divider(height: 0.5),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Color(0xff0d47a1),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ),
          SizedBox(height: 30),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _login,
              child: Ink(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[800].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(5),
                      child: loader
                          ? Container(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
