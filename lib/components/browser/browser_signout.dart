import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowserSignout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Browser'),
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
            Container(
              height: 120,
              child: Column(
                children: [
                  Text('Sign in to skill up today',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text('Keep your skill up-to-date with access to\nthousands of courses by industry experts.'),
                  RaisedButton(
                      child: Text(
                        'SIGN IN TO START WATCHING',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      onPressed: () {

                      }),
                ],
              ),
            ),
            Container(
              height: 100,
              child: IconButton(
                icon: Image.asset('assets/images/new_releases.png'),
                iconSize: 300,
                onPressed: () {},
              ),
            ),
            Container(
              height: 100,
              child: IconButton(
                icon: Image.asset('assets/images/recommend.png'),
                iconSize: 300,
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Container(
                  height: 100,
                  width: 155,
                  child: IconButton(
                    icon: Image.asset('assets/images/conferences.png'),
                    iconSize: 300,
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 100,
                  width: 155,
                  child: IconButton(
                    icon: Image.asset('assets/images/software.png'),
                    iconSize: 300,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 155,
                  child: IconButton(
                    icon: Image.asset('assets/images/certifications.png'),
                    iconSize: 300,
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 100,
                  width: 155,
                  child: IconButton(
                    icon: Image.asset('assets/images/it.png'),
                    iconSize: 300,
                    onPressed: () {},
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