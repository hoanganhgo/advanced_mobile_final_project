import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends PreferredSize {
  final String name;
  final double height;

  AppBarCustom({this.height = kToolbarHeight, this.name});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.name),
      backgroundColor: Constant.primaryColor,
      actions: [
        FlatButton(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            onPressed: () {
              if (this.name != 'Sign In') {
                Navigator.pushNamed(context, '/login');
              }
            },
        ),
        IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {

            })
      ],
    );
  }
}
