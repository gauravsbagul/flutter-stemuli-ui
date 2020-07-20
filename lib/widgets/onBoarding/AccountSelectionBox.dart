import 'package:flutter/material.dart';

class AccountSelectionBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color boxColor;

  AccountSelectionBox({
    this.title,
    this.color,
    this.boxColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 29,
              width: 29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: boxColor,
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0x3404071D),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0x34151612)),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Colors.blueAccent,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.blue,
                        blurRadius: 9.0,
                        offset: Offset(2, 4),
                        spreadRadius: 0.3,
                      ),
                    ],
                  ),
                  child: IconButton(
                    enableFeedback: true,
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => print('clicked'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
