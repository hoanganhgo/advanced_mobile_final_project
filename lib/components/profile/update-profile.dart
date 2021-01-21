import 'dart:io';

import 'package:advanced_mobile_final_project/business/service/validation.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:advanced_mobile_final_project/network/profile-network.dart';
import 'package:advanced_mobile_final_project/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:advanced_mobile_final_project/widget/input-box.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:imgur/imgur.dart' as imgur;
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  File _image;
  final picker = ImagePicker();
  ImageProvider avatar;
  bool chooseAvatar = false;
  var nickName = new TextEditingController();
  var phoneNumber = new TextEditingController();
  double processBar = 0.0;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        this._image = new File(pickedFile.path);
        this.avatar = AssetImage(pickedFile.path);
        print(pickedFile.path);
        this.chooseAvatar = true;
      } else {
        print('No image selected.');
      }
    });
  }

  validateInput(BuildContext context) {
    String content = '';
    if (this.nickName.text.isEmpty) {
      content = S.current.name_empty;
    } else if (!Validation.isNumberPhone(this.phoneNumber.text)) {
      content = S.of(context).message_phone_invalid;
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    if (!this.chooseAvatar) {
      this.avatar = NetworkImage(store.user.avatar);
      this.nickName.text = store.user.name == null ? S.current.anonymous : store.user.name;
      this.phoneNumber.text = store.user.phone;
    }

    return Scaffold(
      appBar: AppBarCustom(name: S.current.profile, avatar: NetworkImage(store.user.avatar)),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
                radius: 80,
                backgroundImage: this.avatar,
            ),
            SizedBox(height: 5),
            FlatButton(
                onPressed: () async {
                  await this.getImage();
                },
                child: Text(S.current.choose_avatar),
            color: Colors.grey.shade200),
            SizedBox(height: 5),
            Divider(height: 5),
            SizedBox(height: 5),
            InputBox(title: S.current.nick_name, editText: this.nickName),
            SizedBox(height: 5),
            InputBox(title: S.current.phone, editText: this.phoneNumber),
            SizedBox(height: 10),
            Container(
              width: Constant.BUTTON_WIDTH,
              child: RaisedButton(
                onPressed: () async {
                  String notify = validateInput(context);
                  if (notify.isNotEmpty) {
                    AlertDialogBasic(title: S.current.notify, content: notify, actions: [
                      FlatButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text(S.current.btn_ok))
                    ]).show(context);
                    return;
                  }

                  setState(() {
                    this.processBar = 50.0;
                  });

                  String avatarLink = store.user.avatar;

                  if (this._image != null) {
                    final client = imgur.Imgur(imgur.Authentication.fromToken(store.user.token));

                    /// Upload an image from path
                    await client.image
                        .uploadImage(
                        imagePath: this._image.path,
                        title: 'Avatar',
                        description: 'Avatar')
                        .then((image) => avatarLink = image.link);

                  }

                  await ProfileNetwork.updateProfile(store.user.token, this.nickName.text,
                      this.phoneNumber.text, avatarLink);

                  store.user.avatar = avatarLink;
                  store.avatar = NetworkImage(store.user.avatar);
                  store.user.name = this.nickName.text;
                  store.user.phone = this.phoneNumber.text;

                  setState(() {
                    this.processBar = 0.0;
                  });

                  AlertDialogBasic(title: S.current.notify, content: S.current.update_profile_success, actions: [
                    FlatButton(
                        onPressed: () {
                          store.avatar = NetworkImage(store.user.avatar);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/main');
                        },
                        child: Text(S.current.btn_ok))
                  ]).show(context);
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
            Center(
                child: Container(
                  height: this.processBar,
                  color: Colors.transparent,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}