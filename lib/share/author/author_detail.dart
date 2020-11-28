import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author'),
        actions: [
          PopupMenuButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage('https://phunugioi.com/wp-content/uploads/2020/01/anh-avatar-supreme-dep-lam-dai-dien-facebook.jpg'),
              ),
              itemBuilder: (BuildContext context) {
                return null;
              }),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('https://phunugioi.com/wp-content/uploads/2020/01/anh-avatar-supreme-dep-lam-dai-dien-facebook.jpg'),
            ),
            Text('Miko Jeson',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            Container(
              width: 300,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.blue,
                child: Text('FOLLOW'),
              ),
            ),
            Text('Miko Jeson is my idol',
              style: TextStyle(
                fontSize: 14,
              ),),
            Row(
              children: [
                IconButton(icon: Icon(Icons.wifi), onPressed: null),
                IconButton(icon: Icon(Icons.swipe), onPressed: null),
              ],
            )
          ],
        ),
      )
    );
  }

}