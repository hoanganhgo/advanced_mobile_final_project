import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    UserModel model = store.user;

    return Scaffold(
      appBar: AppBarCustom(name: S.current.profile, avatar: store.avatar),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(model.avatar)
            ),
            SizedBox(height: 5),
            Text(model.name == null ? S.current.anonymous : model.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 10),
            Divider(height: 5),
            Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(S.current.email + ": ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ),
                  Text(model.email,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                    ),
                  ),
                ],
              )
            ),
            Container(
                margin: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(S.current.phone + ": ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    Text(model.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      ),
                    ),
                  ],
                )
            ),
            Container(
              width: Constant.BUTTON_WIDTH,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/update-profile');
                },
                color: store.primaryColor,
                textColor: Colors.white,
                child: Text(
                  S.current.UPDATE_PROFILE,
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
                onPressed: () {
                  store.user = null;
                  store.avatar = AssetImage('assets/images/none_avatar.jpg');
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/main');
                },
                color: store.primaryColor,
                textColor: Colors.white,
                child: Text(
                  S.current.SIGN_OUT,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
