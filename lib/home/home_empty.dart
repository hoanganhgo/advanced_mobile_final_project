import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(name: 'Home'),
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