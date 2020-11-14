import 'package:advanced_mobile_final_project/browser/browser.dart';
import 'package:advanced_mobile_final_project/download/empty_download.dart';
import 'package:advanced_mobile_final_project/home/home.dart';
import 'package:advanced_mobile_final_project/share/video.dart';
import 'package:advanced_mobile_final_project/share/video_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<StatefulWidget> {
  var tabs = [Home(), EmptyDownload(), Browser(), Search()];
  var index = 3;
  var redirect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  width: 500,
                  height: 548,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                      Container(
                        width: 180.0,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: VideoHorizontal(),
                      ),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}