import 'dart:convert';

import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  double WIDTH = 300;
  var emailInput = new TextEditingController();
  var passwordInput = new TextEditingController();

  showAlertDialog(BuildContext context, bool isSuccess, String content) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        if (isSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SignIn"),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return Scaffold(
      appBar: AppBarCustom(name: 'Sign In', avatar: store.avatar),
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
                      controller: this.emailInput,
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
                      controller: this.passwordInput,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () async {
                  var url = 'http://api.dev.letstudy.org/user/login';
                  var response = await http.post(url, body: {
                    'email': this.emailInput.text,
                    'password': this.passwordInput.text
                  });

                  Map<String, dynamic> json = jsonDecode(response.body);
                  Map<String, dynamic> userInfo = json['userInfo'];
                  String token = json["token"];

                  if (response.statusCode == 200) {
                    store.user = new UserModel(userInfo['id'], userInfo['email'],
                        userInfo['avatar'], userInfo['name'], userInfo['phone'], token);

                    store.avatar = NetworkImage(store.user.avatar);
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/main');
                  } else {
                    showAlertDialog(context, false, json['message']);
                  }
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
                onPressed: () async {
                  var result = await Navigator.pushNamed(context, '/sign-up');
                  this.emailInput.text = result;
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