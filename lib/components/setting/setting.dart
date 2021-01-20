import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String version = "";

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  Widget getButton(var store, BuildContext context) {
    if (store.user == null) {
      return Container(
        width: Constant.BUTTON_WIDTH,
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/login');
          },
          color: store.primaryColor,
          textColor: Colors.white,
          child: Text(
            "SIGN IN",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      );
    } else {
      return Container(
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
            "SIGN OUT",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return Scaffold(
      appBar: AppBarCustom(name: "Setting", avatar: store.avatar),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.brightness_2),
                    SizedBox(width: 10),
                    Text("Dark mode",
                    style: TextStyle(
                      fontSize: 18
                    ),),
                  ],
                ),
                Switch(
                    value: store.darkMode
                    , onChanged: (bool value) {
                      setState(() {
                        store.darkMode = value;

                        if (store.darkMode) {
                          store.primaryColor = Constant.darkColor;
                        } else {
                          store.primaryColor = Constant.lightColor;
                        }

                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/main');
                      });
                })
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.language),
                    SizedBox(width: 10),
                    Text("Language",
                      style: TextStyle(
                          fontSize: 18
                      ),),
                  ],
                ),
                FlatButton(
                  color: Colors.grey.shade200,
                    onPressed: () async {
                      AlertDialogBasic(
                        title: "Change Language",
                        content: "Please choose your language",
                        actions: [
                          FlatButton(
                              onPressed: () async {
                                await S.load(Locale("en"));
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, "/main");
                              },
                              child: Text("English")),
                          FlatButton(
                              onPressed: () async {
                                await S.load(Locale("vi"));
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, "/main");
                              },
                              child: Text("Việt Nam"))
                        ]
                      ).show(context);
                    },
                    child: Text(S.current.my_language))
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.contact_mail),
                    SizedBox(width: 10),
                    Text("Contact",
                      style: TextStyle(
                          fontSize: 18
                      ),),
                  ],
                ),
                FlatButton(
                    color: Colors.grey.shade200,
                    onPressed: () {
                      AlertDialogBasic(
                        title: "About me",
                        content: "Full name: Luong Hoang Anh\nMSSV: 1712276\n"
                            "University: HCMUS\nEmail: anhluong660@gmail.com",
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ]
                      ).show(context);
                    },
                    child: Text("About me"))
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.mobile_friendly),
                    SizedBox(width: 10),
                    Text("Version",
                      style: TextStyle(
                          fontSize: 18
                      ),),
                  ],
                ),
                Container(
                  height: 40,
                  width: 80,
                  color: Colors.grey.shade200,
                  child: Center(
                      child: Text(this.version,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),)),
                )
              ],
            ),
            SizedBox(height: 50),
            getButton(store, context)
          ],
        ),
      )
    );
  }
}
