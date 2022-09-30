import 'package:flutter/material.dart';
import '../screens/Login.dart';
import '../screens/Signup.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Account Page'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.person_add),
                          title: Text('Sign up'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.person_add_alt),
                          title: Text('Login'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.close),
                          title: Text('Sign up'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
            );
          },
        ),
      )
    );
  }

  
}