import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homehealers/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences SharedStorage;

class loginModel extends ChangeNotifier {
  var opacity = true;

  var showpass = true;
  var isEnable = false;
  var eye = Icon(Icons.visibility);
  changeOpacity(int i) {
    if (i == 0)
      opacity = true;
    else
      opacity = false;
    notifyListeners();
  }

  changeIcon() {
    if (showpass)
      eye = Icon(Icons.visibility_off);
    else
      eye = Icon(Icons.visibility);

    showpass = !showpass;

    notifyListeners();
  }

  Future<void> _initPrefs() async {
    SharedStorage = await SharedPreferences.getInstance();
  }

  Future<void> insertdata(String email, String password, context) async {
    print(email);
    print(password);
    final url = Uri.parse('http://admin.home-healers.com/api/user/login');
    await _initPrefs();
    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('login successful!');
        var token = jsonDecode(response.body)['success']['token'];
        var name = jsonDecode(response.body)['success']['name'];
        if (token != null) await SharedStorage.setString('token', token);
        if (name != null) await SharedStorage.setString('name', name);

        isEnable = !isEnable;
        var Snack = SnackBar(content: Text("تم تسجيل الدخول بنجاح"));
        ScaffoldMessenger.of(context).showSnackBar(Snack);

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return Home();
            },
          ),
        );
      } else {
        print('login failed!');
        isEnable = !isEnable;

        var Snack = SnackBar(
            content: Container(
          child: Text(
            "فشل في تسجيل الدخول",
            style: TextStyle(color: Colors.red),
          ),
        ));
        ScaffoldMessenger.of(context).showSnackBar(Snack);
      }
    } catch (error) {
      isEnable = !isEnable;

      print('Error connecting to server: $error');
    }
  }
}
