import 'package:advanced_mobile_final_project/components/search/search-course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business/share/author/author_detail.dart';
import 'business/share/course/course_detail.dart';
import 'ui/list-course-vertical.dart';
import 'business/share/other/app_bar.dart';
import 'constant/constant.dart';
import 'components/browser/browser.dart';
import 'components/download/empty_download.dart';
import 'components/home/home.dart';
import 'components/profile/profile.dart';
import 'components/profile/sign_in.dart';
import 'components/profile/sign_up.dart';
import 'components/search/search_bar.dart';
import 'model/store_model.dart';
import 'package:multilanguage/multilanguage.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StoreModel>(create: (context) => StoreModel()),
      ],
      child: MaterialApp(
        title: 'E-Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Main(),
        routes: {
          '/main': (context) => Main(),
          '/author-detail': (context) => AuthorDetail(),
          '/video-course': (context) => CourseDetail(),
          '/login': (context) => SignIn(),
          '/list-course': (context) => ListCourseVertical(),
          '/sign-up': (context) => SignUp(),
          '/profile': (context) => Profile(),
        },
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var tabs = [Home(), EmptyDownload(), Browser(), SearchCourse(searchContent: "")];
  var tabNames = ['Home', 'Download', 'Browser', 'Search'];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    // Multilanguage.setLanguage(path: Languages.en, context: context);
    // multilang.get('title');

    return Scaffold(
      appBar: index!=3 ? AppBarCustom(name: this.tabNames[this.index], avatar: store.avatar) : SearchBar(name: this.tabNames[this.index]),
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

