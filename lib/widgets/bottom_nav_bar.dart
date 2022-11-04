import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/search_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/watchlist_screen.dart';
import '../services/google_service.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {

  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromRGBO(28, 28, 33, 1),
      padding: const EdgeInsets.symmetric(horizontal: 35),
      height: 50,
      width: double.infinity,
      // double.infinity means it cove the available width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            width: 5,
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.home,
              color: widget.index == 0 ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              if (widget.index != 0) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeScreen(),
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              }
            },
          ),
          IconButton(
            key: Key('search_button'),
            icon: Icon(
              CupertinoIcons.search,
              color: widget.index == 1 ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              if (widget.index != 1) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SearchScreen(),
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, -1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.grey,
            ),
            onPressed: () {
              if (FirebaseAuth.instance.currentUser == null) {
                showAccount(mHeight * 0.6);
              } else {
                showAccountAfterLogin(mHeight * 0.6);
              }
            },
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  void showAccount(double height) {
    showDialog<String>(
      barrierColor: Colors.white54,
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
            padding: EdgeInsets.only(top: height),
            child: SimpleDialog(
              insetPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset(
                            'assets/icons/login.png',
                            width: 30,
                            height: 30,
                          ),
                          title: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            bottomSheetLoginSignup(0);
                          }),
                      ListTile(
                        leading: Image.asset(
                          'assets/icons/signup.png',
                          width: 30,
                          height: 30,
                        ),
                        title: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () => bottomSheetLoginSignup(1),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/icons/setting.png',
                          width: 30,
                          height: 30,
                        ),
                        title: const Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Watchlist())),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/icons/question_mark.png',
                          width: 30,
                          height: 30,
                        ),
                        title: const Text(
                          'Q&A Support',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () async {
                          var url = "https://support.todaytix.com/support/home";
                          if(await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          }
                        }
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      )
    );
  }

  void showAccountAfterLogin(double height) {
      String? profileImage =
          FirebaseAuth.instance.currentUser?.photoURL.toString();
      showDialog<String>(
      barrierColor: Colors.white54,
      context: context,
        builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
              padding: EdgeInsets.only(top: height),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser?.photoURL != null ? '$profileImage' : '',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 20),
                  SimpleDialog(
                    insetPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    titlePadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assets/icons/question_mark.png',
                          width: 30,
                          height: 30,
                        ),
                        title: const Text(
                          'Q&A Support',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () => {
                          GoogleService.logOut(),
                          Navigator.of(context, rootNavigator: true)
                          .pop('dialog')
                        }
                      ),
                    ],
                  ),
                ],
              )
          ),
        )
    );
  }

  _launchURL() async {
    const url = "https://flutter.io";
    if (await canLaunchUrlString(url))
      await launchUrlString(url);
    else
      throw "Could not launch $url";
  }

  void bottomSheetLoginSignup(int screen) {
    TabController tabController =
        TabController(initialIndex: screen, length: 2, vsync: this);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            height: 700,
            child: Stack(
              children: [
                Container(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      const LoginScreen(),
                      const SignupScreen()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear),
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
                          color: const Color.fromARGB(100, 90, 34, 34)),
                      child: TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(
                            child: Text('Log in',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ),
                          Tab(
                            child: Text('Sign up',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          )
                        ],
                      )),
                ),
              ],
            )));
  }
}

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
