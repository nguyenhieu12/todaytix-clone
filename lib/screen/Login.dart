import 'package:flutter/material.dart';

import 'Signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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