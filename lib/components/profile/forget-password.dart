import 'package:advanced_mobile_final_project/business/service/validation.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:advanced_mobile_final_project/widget/input-box.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ForgetPassword extends StatelessWidget {
  final double WIDTH = 300;
  var emailInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return Scaffold(
        appBar: AppBarCustom(name: S.of(context).forget_password, avatar: store.avatar),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                  image: AssetImage('assets/images/e-learning.webp')
              ),
              InputBox(title: S.of(context).email, editText: this.emailInput),
              SizedBox(height: 30),
              Container(
                width: this.WIDTH,
                child: RaisedButton(
                  onPressed: () async {
                    if (!Validation.isEmail(this.emailInput.text)) {
                      AlertDialogBasic(title: S.of(context).forget_password, content: S.of(context).message_email_invalid,
                      actions: [
                        FlatButton(
                          child: Text(S.of(context).btn_ok),
                          onPressed:  () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        )
                      ]).show(context);
                      return;
                    }

                    var response = await http.post(API.FORGET_PASSWORD, body: {
                      'email': this.emailInput.text,
                    });

                    //Map<String, dynamic> json = jsonDecode(response.body);
                    //print(json);
                  },
                  color: store.primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    S.of(context).send_email,
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
