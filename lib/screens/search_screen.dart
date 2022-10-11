import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/show_model.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'watchlist_screen.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  /*final controller = TextEditingController();*/

  bool flag = false;

  static List<Show> allShows = [
    Show(
      title: "Gaylarious: Comedy Laugh Festival",
      subtitle: "From 12",
      urlImage: "assets/1.jfif",
    ),
    Show(
      title: "Chamber Magic",
      subtitle: "",
      urlImage: "assets/2.jfif",
    ),
    Show(
      title: "Drunk Shakespeare",
      subtitle: "From 45",
      urlImage: "assets/3.jfif",
    ),
    Show(
      title: "Merrily We Roll Along",
      subtitle: "",
      urlImage: "assets/4.jfif",
    )
  ];

  List<Show> displayShow = List.from(allShows);

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              /*controller: controller,*/
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(CupertinoIcons.search, color: Colors.white,),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "Search for shows in New York"
              ),
              onChanged: searchShow,
            ),
            const SizedBox(height: 20,),
            SizedBox(
                height: 2000,
                child: displayShow.isNotEmpty
                    ? ListView.builder(
                    itemCount: displayShow.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Image.asset(
                            displayShow[index].urlImage,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 100,
                          ),
                          title: Column(
                            children: [
                              Text(
                                displayShow[index].title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                displayShow[index].subtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()))
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                )
                    : const Text(
                  'Sorry, no results found.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
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

  void searchShow(String query) {
    setState(() => displayShow = allShows.where(
        (show) => show.title.toLowerCase().contains(query.toLowerCase())
    ).toList());
  }

  void showAccount(double height) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(top: height),
          child: SimpleDialog(
            children: [
              ListTile(
                leading: Image.asset('assets/icons/login.png'),
                title: Text('Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                onTap: () => bottomSheetLoginSignup(0),
              ),
              ListTile(
                leading: Image.asset('assets/icons/signup.png'),
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
