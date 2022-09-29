import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'Login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                                    },
                                    child: Text('Log in',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white
                                        )
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Sign up',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black
                                        )
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          const Text('Join',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          ),
                          const Text('TodayTix',
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
            height: 140,
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
              ],
            ),
          ),
          Text('By continuing past this screen you confirm that you agree',
            style: TextStyle(
              fontSize: 14
            ),
          ),
          SizedBox(height: 3),
          Text('to our Terms of Use & Privacy Policy.',
            style: TextStyle(
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }

}
