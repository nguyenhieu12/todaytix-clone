import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../main.dart';
import '../services/google_service.dart';
/*
import 'package:flutter_project/services/google_service.dart';
*/


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(20),
      height: 665,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      child: Column(
        children: [
          ClipPath(
            clipper: LoginScreenClipPath(),
            child: Container(
                height: 310,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0,
                          0.7
                        ],
                        colors: [
                          Colors.pink,
                          Colors.red
                        ]
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                      child: Column(
                        children: const [
                          SizedBox(height: 50),
                          Text('Welcome',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          ),
                          Text('Back',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          ),
                        ],
                      )
                  ),
                )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () async {
                      await GoogleService.logInWithGoogle();
                      if(FirebaseAuth.instance.currentUser != null) {
                        print('Logged in');
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                        Navigator.pop(context);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(40, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Logo(Logos.google, size: 25),
                        const SizedBox(width: 40),
                        Center(
                          child: const Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(40, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.email_outlined, size: 26, color: Colors.black),
                        const SizedBox(width: 40),
                        Center(
                          child: const Text(
                            'Continue with Email',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(40, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.facebook, size: 28, color: CupertinoColors.systemBlue),
                        const SizedBox(width: 40),
                        Center(
                          child: const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  static void loginAndHideDialog() {
    GoogleService.logInWithGoogle();

  }
}

class LoginScreenClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 120);
    path.quadraticBezierTo(width / 2, height, width, height - 120);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
