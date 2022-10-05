import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/watchlist_screen.dart';

class AccountScreen extends StatefulWidget {

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text('Sign up'),
                  onTap: () {
                    BottomSheetLoginSignup();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_add_alt),
                  title: const Text('Login'),
                  onTap: () {
                    BottomSheetLoginSignup();
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

  void BottomSheetLoginSignup() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.clear)
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
/**/
/*return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Sign up'),
                  onTap: () {
                    BottomSheetLoginSignup();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_add_alt),
                  title: Text('Login'),
                  onTap: () {
                    BottomSheetLoginSignup();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );*/