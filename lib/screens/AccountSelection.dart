import 'package:flutter/material.dart';

import 'package:STEMuli/widgets/onBoarding/AccountSelectionBox.dart';

class AccountSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage_img.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    color: Color(0xF2DDF3F3),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 32),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AccountSelectionBox(
                              title: 'Student',
                              icon: Icons.assignment,
                              boxColor: Colors.red[50],
                              color: Colors.red,
                            ),
                            SizedBox(width: 20),
                            AccountSelectionBox(
                              title: 'Teacher',
                              icon: Icons.local_library,
                              boxColor: Colors.green[100],
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              centerTitle: true,
              title: Text(
                "STEMuli",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }
}
