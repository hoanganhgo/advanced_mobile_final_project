import 'package:advanced_mobile_final_project/browser/browser.dart';
import 'package:advanced_mobile_final_project/download/empty_download.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/share/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var tabs = [Home(), EmptyDownload(), Browser(), Search()];
  var index = 0;
  var redirect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            PopupMenuButton(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://phunugioi.com/wp-content/uploads/2020/01/anh-avatar-supreme-dep-lam-dai-dien-facebook.jpg'),
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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Software Development',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  child: Text(
                    'See all >',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {

                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 260,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('IT Operations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  child: Text(
                    'See all >',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {

                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 260,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data Professional',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  child: Text(
                    'See all >',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {

                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 260,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Video(),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        )
    );
  }
}