import 'package:flutter/material.dart';

import 'package:STEMuli/widgets/onBoarding/OnBoardingContainer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingContainer(
      title: 'Sign In',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
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
              'Sign in as a',
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
              autocorrect: false,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
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
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              print('login');
            },
            child: Text('login'),
          )
        ],
      ),
    );
  }
}
