class UserModel {
  String _id;
  String _email;
  String _avatar;
  String _name;
  String _phone;
  String _token;

  UserModel(this._id, this._email, this._avatar, this._name, this._phone,
      this._token);

  String get token => _token;

  String get phone => _phone;

  String get name => _name;

  String get avatar => _avatar;

  String get email => _email;

  String get id => _id;
}