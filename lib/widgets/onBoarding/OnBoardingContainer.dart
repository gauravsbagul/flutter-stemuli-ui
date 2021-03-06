import 'package:flutter/material.dart';

import 'package:STEMuli/style/color.dart';

class OnBoardingContainer extends StatefulWidget {
  final Widget child;
  final String title;

  OnBoardingContainer({this.child, this.title});

  @override
  _OnBoardingContainerState createState() => _OnBoardingContainerState();
}

class _OnBoardingContainerState extends State<OnBoardingContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage_img.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                AppBar(
                  centerTitle: true,
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(24),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                      color: HexColor('#F3F5F9'),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 32),
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
