import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Let\'s get you started',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400
            ),
            ),
            Divider(),
            IconButton(
                icon: Icon(Icons.apps),
                onPressed: null),
            Text('Browser new & popular courses'),
            Divider(),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: null),
            Text('Search the library')
          ],
        ),
      ),
    );
  }

}