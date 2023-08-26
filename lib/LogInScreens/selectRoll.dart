import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homehealers/LogInScreens/login.dart';
import 'package:homehealers/model/loginModel.dart';
import 'package:provider/provider.dart';

class SellectRoll extends StatelessWidget {
  const SellectRoll({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Container(
          width: width,
          height: height * 0.05,
          alignment: Alignment.centerRight,
          child: (ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return LogIn();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              backgroundColor: Color(0xFF37D2F4),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.arrow_forward),
              ],
            ),
          )),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            width: width * 0.9,
          ),
          Text(
            "تسجيل الدخول",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.06),
          ),
          Text("من فضلك قم بإختيار نوع تسجيل الدخول",
              style: TextStyle(fontSize: width * 0.04)),
          SizedBox(
            height: height * 0.02,
          ),
          Consumer<loginModel>(
            builder: (context, value, child) {
              return Opacity(
                opacity: value.opacity ? 1 : 0.5,
                child: InkWell(
                  onTap: () {
                    value.changeOpacity(0);
                  },
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF37D2F4),
                        width: width * 0.008,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/patient.png"),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "طالب رعاية \n (مريض)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Consumer<loginModel>(
            builder: (context, value, child) {
              return Opacity(
                opacity: value.opacity ? 0.5 : 1,
                child: InkWell(
                  onTap: () {
                    value.changeOpacity(1);
                  },
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF37D2F4),
                        width: width * 0.008,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/patient.png"),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "مقدم خدمة \n (اخصائي)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
