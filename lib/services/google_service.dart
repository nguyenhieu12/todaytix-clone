import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      }
    );
  }

  static logInWithGoogle() async {
    final GoogleSignInAccount? user = await GoogleSignIn(
      scopes: <String>["email"]
    ).signIn();

    final GoogleSignInAuthentication authentication = await user!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static logOut() {
    FirebaseAuth.instance.signOut();
  }


}
