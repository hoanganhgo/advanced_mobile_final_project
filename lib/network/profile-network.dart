import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:http/http.dart' as http;

class ProfileNetwork {
  static Future updateProfile(String token, String nickName, String phone, String avatar) async {
    var response = await http.put(API.UPDATE_PROFILE,
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
      "name": nickName,
      "avatar": avatar,
      "phone": phone
    });

    print(response.body);
  }
}