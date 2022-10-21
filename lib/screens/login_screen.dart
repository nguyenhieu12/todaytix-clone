import 'package:flutter/material.dart';

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
                          0.4
                        ],
                        colors: [
                          Color.fromARGB(100, 197, 0, 35),
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
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      GoogleService.signInWithGoogle();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(100, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google_logo.png',
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(width: 45),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(100, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/email_logo.png',
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 40),
                        const Text(
                          'Continue with email',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(100, 192, 192, 192),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/facebook_logo.png',
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(width: 40),
                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black
                            ),
                          )
                        ],
                      ),
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