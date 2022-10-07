import 'package:flutter/material.dart';
import 'package:flutter_project/services/google_service.dart';
import '../screens/signup_screen.dart';

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
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Colors.white,
                                        ),
                                        child: const Text('Log in',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 25),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const SignupScreen()));
                                        },
                                        style: OutlinedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: const Text('Sign up',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
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
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: OutlinedButton(
                        onPressed: () {

                        },
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
                              'assets/facebook_logo.png',
                              width: 45,
                              height: 45,
                            ),
                            SizedBox(width: 30),
                            const Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black
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
