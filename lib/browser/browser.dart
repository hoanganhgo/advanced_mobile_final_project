import 'package:advanced_mobile_final_project/browser/new_release.dart';
import 'package:advanced_mobile_final_project/share/author/author.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:advanced_mobile_final_project/share/other/path.dart';
import 'package:advanced_mobile_final_project/widget/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserState();
  }
}

class _BrowserState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        MyLargeButton(icon: Icons.new_releases, text: 'TOP NEW COURSE', color: Constant.buttonPrimaryColor),
        MyLargeButton(icon: Icons.shopping_bag, text: 'TOP SELL', color: Colors.green.shade400),
        MyLargeButton(icon: Icons.star, text: 'TOP RATING', color: Colors.red.shade400),
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
    );
  }
}