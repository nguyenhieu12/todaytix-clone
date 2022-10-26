import 'package:flutter_project/screens/watchlist_screen.dart';
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
import 'tab_builder.dart';
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
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: [0, 1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () => Get.to(
                        DetailsScreen(movie: controller.mainTopRatedMovies[i]),
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(Api.imageBaseUrl + controller.mainTopRatedMovies[i].posterPath),
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
                                  controller.mainTopRatedMovies[i].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), //Textstyle
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
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
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
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, -1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
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

  void showAccount(double height) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: SimpleDialog(
            children: [
              ListTile(
                leading: Image.asset('assets/icons/login.png',
                  width: 30,
                  height: 30,
                ),
                title: const Text('Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () {
                  bottomSheetLoginSignup(0);
                }
              ),
              ListTile(
                leading: Image.asset('assets/icons/signup.png',
                  width: 30,
                  height: 30,
                ),
                title: const Text('Sign up',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(1),
              ),
              ListTile(
                leading: Image.asset('assets/icons/setting.png',
                  width: 30,
                  height: 30,
                ),
                title: const Text('Setting',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Watchlist()))
                ,
              ),
              ListTile(
                leading: Image.asset('assets/icons/question_mark.png',
                  width: 30,
                  height: 30,
                ),
                title: const Text('Q&A Support',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => _launchURL()
                ,
              ),
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
              ListTile(
                leading: Image.asset('assets/icons/login.png',
                  width: 30,
                  height: 30,
                ),
                title: const Text('Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                onTap: () => bottomSheetLoginSignup(0),
              ),
            ],
          )
      ),
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
                          color: const Color.fromARGB(100, 90, 34, 34)
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
}