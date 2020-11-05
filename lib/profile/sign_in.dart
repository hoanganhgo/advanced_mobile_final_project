import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  double WIDTH = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

            }),
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white70,
              width: this.WIDTH,
              child: Column(
                children: [
                  Text(
                    'Username (or Email)',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              width: this.WIDTH,
              child: Column(
                children: [
                  Text(
                    'Username (or Email)',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  'USE SINGLE SIGN-ON (SSO)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0)
                ),
              ),
            ),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  'SIGN UP FREE',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}