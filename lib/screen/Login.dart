import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:auth_buttons/auth_buttons.dart';

import 'Signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: LoginScreenClipPath(),
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
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
                padding: EdgeInsets.only(top: 65),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(100, 90, 34, 34)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                child: Text('Log in',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black
                                    )
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(width: 25),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const SignupScreen()));
                                },
                                child: Text('Sign up',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                  )
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      const Text('Welcome',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                      const Text('Back',
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
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google_logo.png',
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(width: 50),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black
                          ),
                        )
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(100, 192, 192, 192),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/email_logo.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(width: 50),
                        Text(
                          'Continue with email',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(100, 192, 192, 192),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/facebook_logo.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 44),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(100, 192, 192, 192),
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