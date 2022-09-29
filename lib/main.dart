import 'package:flutter/material.dart';
import 'package:flutter_project/screen/Login.dart';
import 'package:flutter_project/screen/Onboarding.dart';
import 'package:flutter_project/screen/Location.dart';
import 'package:flutter_project/screen/Watchlist.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Watchlist()
    );
  }
}