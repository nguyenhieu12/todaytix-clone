import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding: const EdgeInsets.only(top: 75),
                  child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: const [
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: [
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
              ],
            ),
          ),
          const Text(' By continuing past this screen you confirm that you',
            style: TextStyle(
                fontSize: 15
            ),
          ),
          const Text(' agree to our Terms of Use & Privacy Policy',
            style: TextStyle(
                fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
}