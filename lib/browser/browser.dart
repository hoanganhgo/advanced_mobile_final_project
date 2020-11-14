import 'package:advanced_mobile_final_project/browser/new_release.dart';
import 'package:advanced_mobile_final_project/download/empty_download.dart';
import 'package:advanced_mobile_final_project/home/home.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/share/author.dart';
import 'package:advanced_mobile_final_project/share/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserState();
  }
}

class _BrowserState extends State<StatefulWidget> {
  var tabs = [Home(), EmptyDownload(), Browser(), Search()];
  var index = 2;
  var redirect = false;

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
          Container(
            height: 100,
            child: IconButton(
              icon: Image.asset('assets/images/new_releases.png'),
              iconSize: 300,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewRelease()),
                );
              },
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
          Divider(),
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
          Divider(),
          Text('Popular Skills',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
          Container(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text('Angular'),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text('C#'),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text('JavaScript'),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text('Java'),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text('Python'),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Text('Paths',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Path(),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Path(),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Path(),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Path(),
                ),
              ],
            ),
          ),
          Divider(),
          Text('Top Authors',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  child: Author(),
                ),
                Container(
                  width: 100,
                  child: Author(),
                ),
                Container(
                  width: 100,
                  child: Author(),
                ),
                Container(
                  width: 100,
                  child: Author(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}