import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/homePage.dart';
import 'pages/searchPage.dart';
import 'pages/accountPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectIndex = 0;
  bool flag = true;

  void navigateBottomBar(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (selectIndex == 0 && flag == true) {
      return Scaffold(
        body: pages[selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: selectIndex,
          onTap: navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, color: Colors.red),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search, color: Colors.grey),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person, color: Colors.grey),
                label: ''),
          ],
          iconSize: 27,
        ),
      );
    }
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectIndex,
        onTap: navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home,),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search,),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person,),
              label: ''),
        ],
        iconSize: 27,
      ),
    );
  }
}

/*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Image.asset(
                'lib/icons/home_filled.png',
                color: Colors.red,
              );
              SearchPage();
            },
            icon: Container(
              height: 40,
              child: Image.asset(
                'lib/icons/home.png',
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              Image.asset(
                'lib/icons/search.png',
                color: Colors.red,
              );
              SearchPage();
            },
            icon: Container(
              height: 40,
              child: Image.asset(
                'lib/icons/search.png',
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              Image.asset(
                'lib/icons/user.png',
                color: Colors.red,
              );
              AccountPage();
            },
            icon: Container(
              height: 40,
              child: Image.asset(
                'lib/icons/user.png',
                color: Colors.grey,
              ),
            ),
          )
        ],
      )*/

