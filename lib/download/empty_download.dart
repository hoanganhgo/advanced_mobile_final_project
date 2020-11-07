import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
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
            Icon(
              Icons.file_download,
              color: Colors.grey,
              size: 100,
            ),
            Text(
                'Watch your courses on the go!',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22
              ),
            ),
            Text(
                'Download courses so you can\ncontinue to skill up-even when\nyou\'re offline',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
                child: Text(
                  'FIND A COURSE TO DOWNLOAD',
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
    );
  }

}