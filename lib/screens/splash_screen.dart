import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                0.5
              ],
              colors: [
                Color.fromARGB(100, 197, 0, 35),
                Colors.red
              ]
          )
      ),
      child: Center(
        child: Text('𝐭𝐨𝐝𝐚𝐲𝐭𝐢𝐱',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white
          ),
        ),
      )
    );
  }
}
