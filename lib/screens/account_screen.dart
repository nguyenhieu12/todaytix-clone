import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/signup_screen.dart';
import '../screens/watchlist_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          //padding: const EdgeInsets.fromLTRB(0,0,0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Sign up'),
                onTap: () {
                  bottomSheetLoginSignup(1);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt),
                title: const Text('Login'),
                onTap: () {
                  bottomSheetLoginSignup(0);
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.bookmark),
                title: const Text('Watchlist'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Watchlist()));
                },
              ),
            ],
          ),
        )
      ],
    );

  }

  void bottomSheetLoginSignup(int screen) {
    TabController tabController = TabController(initialIndex: screen, length: 2, vsync: this);
    showBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 665,
        //padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
        ),
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
                icon: Icon(CupertinoIcons.clear),
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
