import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  handleAuthState() {
    return StreamBuilder(
      stream: firebaseAuth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      }
    );
  }

  static signInWithGoogle() async {
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

  static signOut() {
    firebaseAuth.signOut();
  }

  static getProfileImage() async {
    if(firebaseAuth.currentUser?.photoURL != null) {
      return Image.network('$firebaseAuth.currentUser.photoURL', height: 100, width: 100);
    }
  }

}
