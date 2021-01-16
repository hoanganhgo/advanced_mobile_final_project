import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  String title;
  TextEditingController editText;
  bool security = false;

  InputBox({this.title, this.editText, this.security});

  @override
  Widget build(BuildContext context) {
    if (this.security == null) {
      this.security = false;
    }

    return Container(
      color: Colors.white70,
      width: Constant.BOX_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Container(
            color: Colors.black12,
            height: Constant.BOX_HEIGHT,
            child: TextField(
              obscureText: this.security,
              style: TextStyle(
                fontSize: 18,
              ),
              controller: this.editText,
            ),
          )
        ],
      ),
    );
  }
}
