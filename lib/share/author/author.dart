import 'file:///E:/Advanced%20Mobile/advanced_mobile_final_project/lib/share/author/author_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
        itemBuilder: (BuildContext context) {
          return null;
        },
        onSelected: (value) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AuthorDetail()),
          // );
        },
    );
  }

}