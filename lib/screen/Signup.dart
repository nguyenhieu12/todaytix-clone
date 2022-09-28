import 'package:flutter/material.dart';

import 'Login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: LoginScreenClipPath(),
        child: Container(
            color: Colors.red,
            height: 350,
            width: MediaQuery.of(context).size.width,
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
                            color: Colors.pink.shade300
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
                              SizedBox(width: 25),
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
    );
  }

}
