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
                  padding: EdgeInsets.only(top: 30),
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
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    child: const Text('Log in',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  TextButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text('Sign up',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
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
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(100, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google_logo.png',
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(width: 45),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(100, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/email_logo.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(width: 40),
                        const Text(
                          'Continue with email',
                          style: TextStyle(
                              fontSize: 22,
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
