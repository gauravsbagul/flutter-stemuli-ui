import 'package:flutter/material.dart';

class OnBoardingContainer extends StatelessWidget {
  final Widget child;
  final String title;

  OnBoardingContainer({this.child, this.title});

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
                    child: child,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              centerTitle: true,
              title: Text(
                title,
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
