import 'dart:convert';

import 'package:advanced_mobile_final_project/business/service/validation.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/widget/input-box.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  var emailInput = new TextEditingController();
  var phoneInput = new TextEditingController();
  var usernameInput = new TextEditingController();
  var passwordInput = new TextEditingController();
  var rePasswordInput = new TextEditingController();

  validateInput(BuildContext context) {
    String content = '';
    if (this.emailInput.text.isEmpty) {
      content = S.of(context).message_email_empty;
    } else if (!Validation.isEmail(this.emailInput.text)) {
      content = S.of(context).message_email_invalid;
    } else if (!Validation.isNumberPhone(this.phoneInput.text)) {
      content = S.of(context).message_phone_invalid;
    } else if (this.usernameInput.text.isEmpty) {
      content = S.of(context).message_username_empty;
    } else if (Validation.hasSpaceCharacter(this.usernameInput.text)) {
      content = S.of(context).message_username_space;
    } else if (this.passwordInput.text.length < 6) {
      content = S.of(context).message_password_short;
    } else if (this.passwordInput.text.compareTo(this.rePasswordInput.text) != 0) {
      content = S.of(context).message_password_not_match;
    }
    return content;
  }

  showAlertDialog(BuildContext context, bool isSuccess, String content) {
    Widget okButton = FlatButton(
      child: Text(S.of(context).btn_ok),
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
      title: Text(S.of(context).sign_up),
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
        appBar: AppBarCustom(name: S.of(context).sign_up, avatar: AssetImage('assets/images/none_avatar.jpg')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              InputBox(title: S.of(context).email, editText: this.emailInput),
              SizedBox(height: 5),
              InputBox(title: S.of(context).phone, editText: this.phoneInput),
              SizedBox(height: 5),
              InputBox(title: S.of(context).username, editText: this.usernameInput),
              SizedBox(height: 5),
              InputBox(title: S.of(context).password, editText: this.passwordInput, security: true),
              SizedBox(height: 5),
              InputBox(title: S.of(context).re_password, editText: this.rePasswordInput, security: true),
              SizedBox(height: 30),
              Container(
                width: Constant.BUTTON_WIDTH,
                child: RaisedButton(
                  onPressed: () async {
                    var content = validateInput(context);
                    if (content != '') {
                      showAlertDialog(context, false, content);
                      return;
                    }

                    var response = await http.post(API.SIGN_UP, body: {
                      'username': this.usernameInput.text,
                      'email': this.emailInput.text,
                      'phone': this.phoneInput.text,
                      'password': this.passwordInput.text
                    });

                    Map<String, dynamic> message = jsonDecode(response.body);
                    showAlertDialog(context, response.statusCode == 200, message['message']);
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
              Image(
                image: AssetImage('assets/images/e-learning.webp'),
                width: 200,
              ),
            ],
          ),
        )
    );
  }
}
