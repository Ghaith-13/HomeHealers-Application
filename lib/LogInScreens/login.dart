import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../model/loginModel.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email, password;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "مرحباً بعودتك",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  Text(
                    "من فضلك قم بإدخال \n الايميل والرقم السري الخاص بك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: width * 0.01,
                        color: Color(0xFF37D2F4),
                      ),
                    ),
                    child: Image.asset("assets/logIn.png"),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Container(
                      width: width,
                      child: Text(
                        "البريد الالكتروني",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.05,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "ادخل الايميل الخاص بك",
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: width * 0.01),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'البريد الالكتروني فارغ';
                        } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w]{2,4}')
                            .hasMatch(value)) {
                          return 'البريد الالكتروني غير صحيح';
                        } else {
                          email = value;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Container(
                      width: width,
                      child: Text(
                        "الرقم السري",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.05,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Consumer<loginModel>(
                    builder: (context, value, child) {
                      return Container(
                        width: width * 0.9,
                        child: TextFormField(
                          controller: _controller2,
                          obscureText: value.showpass,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "ادخل الرقم السري",
                            suffixIcon: const Icon(Icons.lock),
                            prefixIcon: IconButton(
                              onPressed: () {
                                value.changeIcon();
                              },
                              icon: value.eye,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: width * 0.01),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'كلمة المرور غير مدخلة';
                            } else if (value.length < 5) {
                              return 'طول كلمة المرور أٌقل من 8 محارف';
                            } else {
                              password = value;
                              return null;
                            }
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Container(
                      width: width,
                      child: Text(
                        "نسيت الرقم السري ؟",
                        style: TextStyle(color: Color(0xFF37D2F4)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Consumer<loginModel>(
                    builder: (context, value, child) {
                      return SizedBox(
                        width: width * 0.9,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(double.infinity, 50),
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (!value.isEnable) {
                                value.isEnable = !value.isEnable;

                                value.insertdata(email, password, context);
                              }
                            }
                          },
                          child: value.isEnable
                              ? Container(
                                  child: Lottie.asset('assets/3dots.json',
                                      width: width * 0.15,
                                      height: height * 0.05))
                              : Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تسجيل حساب جديد",
                        style: TextStyle(color: Color(0xFF37D2F4)),
                      ),
                      Text("ليس لديك حساب؟ "),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
