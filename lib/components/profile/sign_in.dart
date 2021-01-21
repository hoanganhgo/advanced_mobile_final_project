import 'dart:convert';

import 'package:advanced_mobile_final_project/business/service/validation.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/widget/input-box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  var emailInput = new TextEditingController();
  var passwordInput = new TextEditingController();

  String validateInput(BuildContext context) {
    var content = "";

    if (!Validation.isEmail(this.emailInput.text)) {
      content = S.of(context).message_email_invalid;
    } else if (this.passwordInput.text.length < 6) {
      content = S.of(context).message_password_short;
    }

    return content;
  }

  showAlertDialog(BuildContext context, bool isSuccess, String content) {
    Widget okButton = FlatButton(
      child: Text(S.of(context).btn_ok),
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
      title: Text(S.of(context).sign_in),
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
      appBar: AppBarCustom(name: S.of(context).sign_in, avatar: store.avatar),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/e-learning.webp')
            ),
            InputBox(title: S.of(context).email, editText: this.emailInput),
            SizedBox(height: 20),
            InputBox(title: S.of(context).password, editText: this.passwordInput, security: true),
            SizedBox(height: 30),
            Container(
              width: Constant.BUTTON_WIDTH,
              child: RaisedButton(
                onPressed: () async {
                  var content = validateInput(context);
                  if (content.isNotEmpty) {
                    showAlertDialog(context, false, content);
                    return;
                  }

                  var response = await http.post(API.SIGN_IN, body: {
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
                    String message = S.of(context).message_sign_in_fail;
                    showAlertDialog(context, false, message);
                  }
                },
                color: store.primaryColor,
                textColor: Colors.white,
                child: Text(
                  S.of(context).SIGN_IN,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Container(
              width: Constant.BUTTON_WIDTH,
              child: RaisedButton(
                onPressed: () async {
                  var result = await Navigator.pushNamed(context, '/sign-up');
                  this.emailInput.text = result;
                },
                color: store.primaryColor,
                textColor: Colors.white,
                child: Text(
                  S.of(context).SIGN_UP,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Container(
              width: Constant.BUTTON_WIDTH,
              child: RaisedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/forget-password');
                },
                color: store.primaryColor,
                textColor: Colors.white,
                child: Text(
                  S.current.FORGET_PASSWORD,
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