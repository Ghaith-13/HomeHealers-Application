import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Future<String?> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');

  return name;
}

TextEditingController _searchController = TextEditingController();

List<String> imageList = [
  'assets/firstPage.png',
  'assets/secondPage.png',
  'assets/thirdPage.png',
];

class _HomeState extends State<Home> {
  String name = '';

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        name = value!;
      });
    });
  }

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Column(children: [
        Container(
          height: height * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(width * 0.07),
              bottomLeft: Radius.circular(width * 0.07),
            ),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 103, 157, 252),
                Color.fromARGB(255, 155, 60, 172),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/patient.png"),
                    Text(
                      " !مرحبا  \n ${name} ,! كيف حالك ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.1),
                      color: Colors.white,
                    ),
                    width: width * 0.7,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "... بحث",
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(157, 55, 209, 244),
                          Color(0xFFB61EEF),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: height * 0.2,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: imageList
              .map((item) => Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  ))
              .toList(),
        )
      ]),
    );
  }
}
