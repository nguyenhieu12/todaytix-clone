import 'package:flutter/material.dart';

import 'details_screen.dart';
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
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                    child: GestureDetector(
                      onTap: () {
/*
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
*/
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/$index.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.bookmark, size: 20, color: Colors.redAccent,),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 7, 20, 5), // left top right bottom,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(64, 61, 70, 1), // 64, 61, 70, 1
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row (
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Mean Girls',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Opens Oct 11',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: const [
                                            Text(
                                              'from 39',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Save 26%',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ]
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            },
          )
      ),
    );
  }

}