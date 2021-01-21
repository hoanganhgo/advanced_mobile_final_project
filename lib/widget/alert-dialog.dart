import 'package:flutter/material.dart';

class AlertDialogBasic {
  String title;
  String content;
  List<Widget> actions;   //actions is a list buttons

  AlertDialogBasic({this.title, this.content, this.actions});

  AlertDialog _create() {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _create();
      },
    );
  }
}