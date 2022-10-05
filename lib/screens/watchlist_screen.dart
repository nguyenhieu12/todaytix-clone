import 'package:flutter/material.dart';

import 'location_screen.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => LocaleState();

}

class LocaleState extends State<Watchlist> {
  LocaleState();

  Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LocationPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    refresh() {
      setState(() {});
    }
    LocationList(update: refresh);
    final String locale = ListState(choice: '').choice;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(102, 98, 161, 100), Colors.black],),),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                label: Text(locale,
                    style: const TextStyle(color: Colors.white, fontSize: 14),),
                onPressed: () {
                  Navigator.push(
                    context,
                    route(),
                  );
                },
              ),
            ],
          ),
          body: GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              children: List.generate(3, (index) {
                return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/1200px-Black_colour.jpg',),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),);
              }),),),
    );
  }

}