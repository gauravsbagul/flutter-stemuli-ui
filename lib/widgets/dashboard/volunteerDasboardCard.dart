import 'package:STEMuli/style/color.dart';
import 'package:flutter/material.dart';

class VolunteerDashboardCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '6',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: HexColor('#f3f5f9'),
          ),
          SizedBox(height: 10),
          Text(
            'Comments need reply',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Muli.ttf',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
