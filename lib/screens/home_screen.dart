import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/screens/watchlist_screen.dart';
import 'package:flutter_project/services/google_service.dart';
import 'package:flutter_project/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../api/api_service.dart';
import '../controllers/movies_controller.dart';
import '../model/movie.dart';
import '../model/utils.dart';
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
  late List<Genre> genres;

  @override
  void initState() {
    super.initState();
    genres = [
      Genre(12, 'Adventure', active: true),
      Genre(16, 'Animation'),
      Genre(35, 'Comedy'),
      Genre(80, 'Crime'),
      Genre(99, 'Documentary'),
      Genre(18, 'Drama'),
      Genre(10751, 'Family'),
      Genre(14, 'Fantasy'),
      Genre(36, 'History'),
      Genre(27, 'Horror'),
      Genre(10402, 'Music'),
      Genre(9648, 'Mystery'),
      Genre(210749, 'Romance'),
      Genre(878, 'Science Fiction'),
      Genre(10770, 'TV Movie'),
      Genre(53, 'Thriller'),
      Genre(10752, 'War'),
      Genre(37, 'Western'),
    ];
  }

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
                        items: controller.upComingMovies.map((movie) {
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
                      /*DefaultTabController(
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
                      )*/
                      Column(
                        children: [
                          SizedBox(
                            height: 42,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Chip(
                                      title: genres[index].title,
                                      active: genres[index].active,
                                      onTap: () {
                                        setState(() {
                                          genres[index].toggleActive();
                                        });
                                      });
                                },
                                separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                                itemCount: genres.length),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<List<Movie>?>(
                              future: ApiService.getAllUpcomingMovies(),
                              builder: (c, snapshot) {
                                if (snapshot.hasData) {
                                  var movies = snapshot.data;
                                  var selectedGenres = genres
                                      .where((e) => e.active)
                                      .map((e) => e.id);
                                  var filteredMovies = movies!.where((a) {
                                    bool shouldAdd = false;
                                    for (int i = 0;
                                    i < a.genreIds.length;
                                    i++) {
                                      if (selectedGenres
                                          .contains(a.genreIds[i])) {
                                        shouldAdd = true;
                                        break;
                                      }
                                    }
                                    return shouldAdd;
                                  }).toList();
                                  return SingleChildScrollView(
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(DetailsScreen(
                                                      movie: filteredMovies[
                                                      index]));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          topLeft:
                                                          Radius.circular(
                                                              10),
                                                          topRight:
                                                          Radius.circular(
                                                              10),
                                                        ),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w500/${filteredMovies[index].posterPath}',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                          children: [
                                                            Container(
                                                              margin: const EdgeInsets
                                                                  .fromLTRB(
                                                                  20,
                                                                  10,
                                                                  10,
                                                                  10),
                                                              child: ClipOval(
                                                                  child:
                                                                  Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                    const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.5),
                                                                    ),
                                                                    child:
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.put(MoviesController())
                                                                            .addToWatchList(
                                                                            filteredMovies[index]);
                                                                      },
                                                                      icon: Obx(
                                                                            () => Get.put(MoviesController())
                                                                            .isInWatchList(filteredMovies[index])
                                                                            ? const Icon(
                                                                          Icons.bookmark,
                                                                          color:
                                                                          Colors.red,
                                                                        )
                                                                            : const Icon(
                                                                          Icons.bookmark_outline,
                                                                          color:
                                                                          Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ),
                                                          ]),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20,
                                                          7,
                                                          20,
                                                          5), // left top right bottom,
                                                      height: 55,
                                                      decoration:
                                                      const BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            64,
                                                            61,
                                                            70,
                                                            1), // 64, 61, 70, 1
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                          Radius.circular(
                                                              10),
                                                          bottomRight:
                                                          Radius.circular(
                                                              10),
                                                        ),
                                                      ),
                                                      child: Row(children: <
                                                          Widget>[
                                                        Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    filteredMovies[
                                                                    index]
                                                                        .title,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 14,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    maxLines:
                                                                    1, //Textstyle
                                                                  ),
                                                                  Text(
                                                                    filteredMovies[
                                                                    index]
                                                                        .releaseDate,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 12,
                                                                      color: Colors
                                                                          .grey,
                                                                    ), //Textstyle
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                                children: [
                                                                  Text(
                                                                    'from 39',
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 14,
                                                                      color: Colors
                                                                          .white,
                                                                    ), //Textstyle
                                                                  ),
                                                                  Text(
                                                                    Utils.getGenres(
                                                                        filteredMovies[
                                                                        index]),
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 12,
                                                                      color: Colors
                                                                          .white,
                                                                    ), //Textstyle
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          separatorBuilder: (_, __) =>
                                          const SizedBox(height: 20),
                                          itemCount: filteredMovies.length));
                                } else {
                                  return Container(
                                    child: Text(
                                      '0 matching result',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                }
                              }),
                        ],
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

class Chip extends StatelessWidget {
  final String title;
  final bool active;
  final Function() onTap;

  const Chip(
      {Key? key,
        required this.title,
        required this.active,
        required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999.0),
            color: active ? Colors.white : Color.fromRGBO(71, 71, 90, 1),
          ),
          child: Text(title,
              style: TextStyle(
                fontSize: 14,
                color: active ? Colors.black : Colors.grey,
              ))),
    );
  }
}

