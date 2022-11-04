import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

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
                              padding: const EdgeInsets.only(left: 15),
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
                    onPressed: () async {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(40, 192, 192, 192),
                    ),
                    child: Row(
                      children: [
                        Logo(Logos.google, size: 25),
                        const SizedBox(width: 40),
                        const Center(
                          child: Text(
                            'Sign up with Google',
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
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(40, 192, 192, 192),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.email_outlined, size: 26, color: Colors.black),
                        SizedBox(width: 40),
                        Center(
                          child: Text(
                            'Sign up with Email',
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
                const Text('By continuing past this screen you confirm',
                  style: TextStyle(
                      fontSize: 15
                  ),
                  maxLines: 1
                ),
                const Text('Terms of Use & Privacy Policy',
                  style: TextStyle(
                      fontSize: 16
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}