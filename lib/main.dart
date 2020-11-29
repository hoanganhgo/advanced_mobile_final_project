import 'package:advanced_mobile_final_project/home/home.dart';
import 'package:advanced_mobile_final_project/profile/sign_in.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/search/search_bar.dart';
import 'package:advanced_mobile_final_project/share/author/author_detail.dart';
import 'package:advanced_mobile_final_project/share/course/video_course.dart';
import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/material.dart';

import 'browser/browser.dart';
import 'download/empty_download.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
      routes: {
        '/author-detail': (context) => AuthorDetail(),
        '/video-course': (context) => VideoCourse(),
        '/login': (context) => SignIn(),
      },
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var tabs = [Home(), EmptyDownload(), Browser(), Search()];
  var tabNames = ['Home', 'Download', 'Browser', 'Search'];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index!=3 ? AppBarCustom(name: this.tabNames[this.index]) : SearchBar(name: this.tabNames[this.index]),
      body: tabs[this.index],
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Constant.primaryColor,
        currentIndex: this.index, // this will be set when a new tab is tapped
        onTap: (int index) {
          setState(() {
            if (this.index != index) {
              this.index = index;
            }
          }
          );
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
    );
  }
}

