import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/signup_screen.dart';
import '../screens/watchlist_screen.dart';

class AccountScreen extends StatefulWidget {

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    BottomSheetLoginSignup(SignupScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_add_alt),
                  title: const Text('Login'),
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    BottomSheetLoginSignup(LoginScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.bookmark),
                  title: const Text('Wachlist'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Watchlist()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void BottomSheetLoginSignup(Widget widget) {
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
            widget,
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.clear),
                color: Colors.white,
              ),
            )
          ],
        )
      )
    );
  }
}
