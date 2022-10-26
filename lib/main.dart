import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  FlutterNativeSplash.removeAfter((p0) => init(null));

  runApp(MyApp());
}

Future init(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodayTix',
      theme: ThemeData(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xFF0C0303),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        primaryColor: Colors.redAccent,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
    // return FutureBuilder<FirebaseUser>(
    //     future: FirebaseAuth.instance.currentUser(),
    //     builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
    //       if (snapshot.hasData){
    //         FirebaseUser user = snapshot.data; // this is your user instance
    //         /// is because there is user already logged
    //         return MainScreen();
    //       }
    //       /// other way there is no user logged.
    //       return LoginScreen();
    //     }
    // );
  }
}
