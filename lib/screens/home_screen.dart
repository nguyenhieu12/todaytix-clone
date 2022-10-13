//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/screens/settings_screen.dart';
import 'package:flutter_project/screens/watchlist_screen.dart';
import 'package:flutter_project/services/google_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'details_screen.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import 'search_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'login_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  int current = 0;
  bool flag = false;

  List<String> titleCarousel = [
    "Football",
    "School",
    "Grocery store",
  ];
  List<String> subtitleCarousel = [
    "I want to play football",
    "I go to school by bus everyday",
    "I want to go to grocery store with my mother at weekend",
  ];

  List<String> items = [
    "All",
    "Watchlist",
    "Lottery & Rush",
    "Date",
    "No-fee",
    "Musicals",
    "Plays",
    "Matinee",
    "Evening"
  ];

  int itemsLength(String item) {
    if (item == "All") {
      return item.length + 40;
    } else if (item == "Watchlist") {
      return item.length + 80;
    } else if (item == "Lottery & Rush") {
      return item.length + 110;
    } else if (item == "Date") {
      return item.length + 50;
    } else if (item == "No-fee") {
      return item.length + 65;
    } else if (item == "Musicals") {
      return item.length + 80;
    } else if (item == "Plays") {
      return item.length + 60;
    } else if (item == "Matinee") {
      return item.length + 70;
    }
    return item.length + 70;
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: [0,1,2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen()));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/$i.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), // left top right bottom
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titleCarousel[i],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), //Textstyle
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  subtitleCarousel[i],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                /// CUSTOM TABBAR
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: itemsLength(items[index]).toDouble(),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.white
                                      : const Color.fromRGBO(64, 61, 70, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        color: current == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),

                Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.bookmark_border, size: 20, color: Colors.white,),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 7, 20, 5), // left top right bottom,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(64, 61, 70, 1), // 64, 61, 70, 1
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row (
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Mean Girls',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Opens Oct 11',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: const [
                                            Text(
                                              'from 39',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Save 26%',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ]
                            ),
                          )
                        ],
                      ),
                    )
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 75,
        width: double.infinity,
        // double.infinity means it cove the available width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Image.asset("assets/icons/home.png",
                width: 25,
                height: 25,
                color: Colors.red,),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset("assets/icons/search.png",
                width: 25,
                height: 25,
                color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SearchScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                  ),
                );
              },
            ),
            IconButton(
              icon: Image.asset("assets/icons/user.png",
                width: 25,
                height: 25,
                color: Colors.grey,
              ),
              onPressed: () {
                showAccount(mHeight * 0.6);
              },
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }

  void isLoggedIn(double height) {
    if(FirebaseAuth.instance.currentUser != null) {

    } else {
      showAccount(height * 0.6);
    }
  }

  void showAccount(double height) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: SimpleDialog(
            children: [
              ListTile(
                leading: Image.asset('assets/icons/login.png',
                  width: 28,
                  height: 28,
                ),
                title: Text('Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(0),
              ),
              ListTile(
                leading: Image.asset('assets/icons/signup.png',
                  width: 26,
                  height: 26,
                ),
                title: Text('Sign up',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(1),
              ),
              ListTile(
                leading: Image.asset('assets/icons/setting.png',
                  width: 26,
                  height: 26,
                ),
                title: Text('Settings',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => SettingScreen(),
              ),
              ListTile(
                leading: Image.asset('assets/icons/question_mark.png',
                  width: 25,
                  height: 25,
                ),
                title: Text('Support & FAQs',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => launchURL('https://support.todaytix.com/support/home'),
              )
            ],
          )
      ),
    );
  }

  void showAccountAfterLogin(double height) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: SimpleDialog(
            children: [
              Container(
                child: GoogleService.getProfileImage()
              ),
              ListTile(
                leading: Image.asset('assets/icons/login.png',
                  width: 28,
                  height: 28,
                ),
                title: Text('Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(0),
              ),
              ListTile(
                leading: Image.asset('assets/icons/signup.png',
                  width: 26,
                  height: 26,
                ),
                title: Text('Sign up',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(1),
              ),
              ListTile(
                leading: Image.asset('assets/icons/setting.png',
                  width: 26,
                  height: 26,
                ),
                title: Text('Settings',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => SettingScreen(),
              ),
              ListTile(
                leading: Image.asset('assets/icons/question_mark.png',
                  width: 25,
                  height: 25,
                ),
                title: Text('Support & FAQs',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => launchURL('https://support.todaytix.com/support/home'),
              )
            ],
          )
      ),
    );
  }

  void bottomSheetLoginSignup(int screen) {
    TabController tabController = TabController(initialIndex: screen, length: 2, vsync: this);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
            ),
            height: 700,
            child: Stack(
              children: [
                Container(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget> [
                      //setTabbarView(screen)
                      LoginScreen(),
                      SignupScreen()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 85, top: 40),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(100, 90, 34, 34)
                      ),
                      child: TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(
                            child: Text('Log in',
                                style: TextStyle(
                                  fontSize: 15,
                                )
                            ),
                          ),
                          Tab(
                            child: Text('Sign up',
                                style: TextStyle(
                                  fontSize: 15,
                                )
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ],
            )
        )
    );
  }

  launchURL(String url) async {
    if(await canLaunchUrlString(url)) {
      await launchURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
