import 'package:advanced_mobile_final_project/browser/browser.dart';
import 'package:advanced_mobile_final_project/home/home.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyDownload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmptyDownloadState();
  }
}

class _EmptyDownloadState extends State<StatefulWidget> {
  var tabs = [Home(), EmptyDownload(), Browser(), Search()];
  var index = 1;
  var redirect = false;

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.index, // this will be set when a new tab is tapped
        onTap: (int index) {
          setState(() {
            if (this.index != index) {
              this.index = index;
              this.redirect = true;
            }
          }
          );
          if (this.redirect) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tabs[this.index]),
            );
          }
          //_navigateToScreens(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.file_download),
            title: new Text('Downloads'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('Browser')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search')
          ),
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