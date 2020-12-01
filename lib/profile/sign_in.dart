import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
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
      appBar: AppBarCustom(name: 'Sign In'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/e-learning.webp')
            ),
            Container(
              color: Colors.white70,
              width: this.WIDTH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username (or Email)',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white70,
              width: this.WIDTH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.black87,
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
                color: Colors.black87,
                textColor: Colors.white,
                child: Text(
                  'USE SINGLE SIGN-ON (SSO)',
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
                color: Colors.black87,
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