import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../controllers/search_controller.dart';
import '../model/movie.dart';
import '../others/utils.dart';
import 'details_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import '../others/search_box.dart';
import 'signup_screen.dart';
import 'watchlist_screen.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SearchBox(
                onSumbit: () {
                  String search =
                      Get.put(SearchController()).searchController.text;
                  Get.put(SearchController()).searchController.text = '';
                  Get.put(SearchController()).search(search);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                (() => Get.put(SearchController()).isLoading.value
                    ? const CircularProgressIndicator()
                    : Get.put(SearchController()).foundedMovies.isEmpty
                    ? SizedBox(
                  width: Get.width / 1.5,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Sorry, no result found!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
                    : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Get.put(SearchController()).foundedMovies.length.toString() + ' results',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      ListView.separated(
                          itemCount: Get.put(SearchController()).foundedMovies.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(height: 20),
                          itemBuilder: (_, index) {
                            Movie movie = Get.put(SearchController())
                                .foundedMovies[index];
                            return GestureDetector(
                              onTap: () => Get.to(DetailsScreen(movie: movie)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      Api.imageBaseUrl + movie.posterPath,
                                      height: 180,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image,
                                        size: 120,
                                      ),
                                      loadingBuilder: (_, __, ___) {
                                        if (___ == null) return __;
                                        return const FadeShimmer(
                                          width: 120,
                                          height: 180,
                                          highlightColor: Color(0xff22272f),
                                          baseColor: Color(0xff20252d),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            movie.title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.star, color: Color(0xFFFF8700),),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  movie.voteAverage == 0.0
                                                      ? 'N/A'
                                                      : movie.voteAverage.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w200,
                                                    color: Color(0xFFFF8700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.ticket, color: Colors.white,),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  Utils.getGenres(movie),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.calendar, color: Colors.white,),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  movie.releaseDate.split('-')[0],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                )),
              ),
            ],
          ),
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
                color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                  ),
                );
              },
            ),
            IconButton(
              icon: Image.asset("assets/icons/search.png",
                width: 25,
                height: 25,
                color: Colors.red,),
              onPressed: () {
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
                title: Text('Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                onTap: () => bottomSheetLoginSignup(0),
              ),
              ListTile(
                leading: Image.asset('assets/icons/signup.png',
                  width: 30,
                  height: 30,
                ),
                title: Text('Sign up',
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                onTap: () => bottomSheetLoginSignup(1),
              ),
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
}