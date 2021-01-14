import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

            }),
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please sign in to view your profile.'),
            RaisedButton(
              onPressed: () {

            },
              child: Text('SIGN IN'),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
  
}