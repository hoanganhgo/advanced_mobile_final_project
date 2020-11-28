import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/material.dart';

class MyLargeButton extends StatelessWidget {
  IconData icon;
  String text;
  var color;
  Function event;
  MyLargeButton({this.icon, this.text, this.color, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
      child: RaisedButton.icon(
        onPressed: () {

        },
        icon: Icon(this.icon),
        label: Text(this.text,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800
          ),
        ),
        color: this.color,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: this.color)
        ),
      ),
    );
  }
}
