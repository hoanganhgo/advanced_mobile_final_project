import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  double WIDTH = 300;
  var emailInput = new TextEditingController();
  var phoneInput = new TextEditingController();
  var usernameInput = new TextEditingController();
  var passwordInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(name: 'Sign Up'),
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
                    var url = 'http://api.dev.letstudy.org/user/register';
                    print(this.emailInput.text);
                    var response = await http.post(url, body: {
                      'username': this.usernameInput.text,
                      'email': this.emailInput.text,
                      'phone': this.phoneInput.text,
                      'password': this.passwordInput.text
                    });
                    print('status: ${response.statusCode}');
                    print('body: ${response.body}');
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
