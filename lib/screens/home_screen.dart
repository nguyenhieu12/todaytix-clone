import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/screens/watchlist_screen.dart';
import 'package:flutter_project/services/google_service.dart';
import 'package:flutter_project/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../api/api_service.dart';
import '../controllers/movies_controller.dart';
import 'details_screen.dart';
import 'package:flutter/cupertino.dart';

import 'search_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'login_screen.dart';
import '../widgets/tab_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final MoviesController controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: mHeight,
        width: mWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(71, 71, 90, 1),
            Color.fromRGBO(28, 28, 33, 1),
          ], begin: Alignment.topRight),
        ),
        child: Obx(
          (() => Get.put(MoviesController()).isLoading.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Something\'s not right',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'We\'re having tecnical difficulties. Please try again in a moment',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        child: Text('Try Again'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: Size(250, 50),
                            backgroundColor: Colors.red,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 44,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 300.0,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                        items: controller.mainTopRatedMovies.map((movie) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () => Get.to(
                                  DetailsScreen(movie: movie),
                                ),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(Api.imageBaseUrl +
                                            movie.posterPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 10,
                                          20, 10), // left top right bottom
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ), //Textstyle
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const TabBar(
                                  indicatorWeight: 4,
                                  labelColor: Colors.red,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: Colors.redAccent,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: [
                                    Tab(text: 'Now playing'),
                                    Tab(text: 'Upcoming'),
                                    Tab(text: 'Top rated'),
                                    Tab(text: 'Popular'),
                                  ]),
                            ),
                            Container(
                              height: 1400,
                              child: TabBarView(children: [
                                TabBuilder(
                                  future: ApiService.getCustomMovies(
                                      'now_playing?api_key=${Api.apiKey}&language=en-US&page=1'),
                                ),
                                TabBuilder(
                                  future: ApiService.getCustomMovies(
                                      'upcoming?api_key=${Api.apiKey}&language=en-US&page=1'),
                                ),
                                TabBuilder(
                                  future: ApiService.getCustomMovies(
                                      'top_rated?api_key=${Api.apiKey}&language=en-US&page=1'),
                                ),
                                TabBuilder(
                                  future: ApiService.getCustomMovies(
                                      'popular?api_key=${Api.apiKey}&language=en-US&page=1'),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
    );
  }

  void showAccount(double height) {
    showDialog<String>(
      barrierColor: Colors.grey.shade100,
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: SimpleDialog(
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
                onTap: () => _launchURL(),
              ),
            ],
          )),
    );
  }

  void showAccountAfterLogin(double height) {
    String? profileImage =
        FirebaseAuth.instance.currentUser?.photoURL.toString();
    showDialog<String>(
      barrierColor: Colors.grey.shade100,
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: Column(
            children: [
              FirebaseAuth.instance.currentUser?.photoURL != null
                  ? Image.network(profileImage!, height: 100, width: 100)
                  : Icon(Icons.account_circle, size: 100),
              SimpleDialog(
                children: [
                  ListTile(
                      leading: Image.asset(
                        'assets/icons/login.png',
                        width: 30,
                        height: 30,
                      ),
                      title: const Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        GoogleService.logOut();
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      }),
                ],
              ),
            ],
          )),
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
