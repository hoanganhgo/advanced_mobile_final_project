import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://phunugioi.com/wp-content/uploads/2020/01/anh-avatar-supreme-dep-lam-dai-dien-facebook.jpg'),
        ),
        itemBuilder: (BuildContext context) {
          return null;
        });
  }

}