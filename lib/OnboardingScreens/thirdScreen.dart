import 'package:flutter/material.dart';
import 'package:homehealers/OnboardingScreens/firstScreen.dart';
import 'package:homehealers/LogInScreens/selectRoll.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/thirdPage.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "عن التطبيق",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "تطبيق هوم هيلرز هو تطبيق طبي \n حيث يستطيع المريض من خلاله العلاج من الإصابات \n المختلفة عن طريق أفضل الأخصائيين",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.12,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 55, 210, 244),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.08,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 198, 217, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.08,
                  height: height * 0.02,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 198, 217, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.02),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: InkWell(
                onTap: () {
                  Navigator.push(
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
                          return SellectRoll();
                        },
                      ));
                },
                child: Text(
                  "تخطي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
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
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return SellectRoll();
                          },
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFF37D2F4),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
