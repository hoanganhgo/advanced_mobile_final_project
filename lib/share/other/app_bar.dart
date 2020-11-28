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
      actions: [
        PopupMenuButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            itemBuilder: (BuildContext context) {
              return null;
            }),
        IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {

            })
      ],
    );
  }
}
