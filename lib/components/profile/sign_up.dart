import 'dart:convert';

import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  double WIDTH = 300;
  var emailInput = new TextEditingController();
  var phoneInput = new TextEditingController();
  var usernameInput = new TextEditingController();
  var passwordInput = new TextEditingController();

  validateInput() {
    String content = '';
    if (this.emailInput.text.isEmpty) {
      content = 'Email is empty';
    } else if (this.phoneInput.text.isEmpty) {
      content = 'Phone is empty';
    } else if (this.usernameInput.text.isEmpty) {
      content = 'Username is empty';
    } else if (this.passwordInput.text.length < 6) {
      content = 'Password must have greater than 6 character';
    }
    return content;
  }

  showAlertDialog(BuildContext context, bool isSuccess, String content) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        if (isSuccess) {
          Navigator.pop(context);
          Navigator.pop(context, this.emailInput.text);
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SignUp"),
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
    return Scaffold(
        appBar: AppBarCustom(name: 'Sign Up', avatar: AssetImage('assets/images/none_avatar.jpg')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/e-learning.webp'),
                width: 200,
              ),
              Container(
                color: Colors.white70,
                width: this.WIDTH,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
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
                        keyboardType: TextInputType.emailAddress,
                        controller: this.emailInput,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                color: Colors.white70,
                width: this.WIDTH,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
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
                        keyboardType: TextInputType.phone,
                        controller: this.phoneInput,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                color: Colors.white70,
                width: this.WIDTH,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
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
                        controller: this.usernameInput,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
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
                    var content = validateInput();
                    if (content != '') {
                      showAlertDialog(context, false, content);
                      return;
                    }

                    var url = 'http://api.dev.letstudy.org/user/register';
                    var response = await http.post(url, body: {
                      'username': this.usernameInput.text,
                      'email': this.emailInput.text,
                      'phone': this.phoneInput.text,
                      'password': this.passwordInput.text
                    });

                    Map<String, dynamic> message = jsonDecode(response.body);
                    showAlertDialog(context, response.statusCode == 200, message['message']);
                    },
                  color: Colors.black87,
                  textColor: Colors.white,
                  child: Text(
                    'SIGN UP',
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
