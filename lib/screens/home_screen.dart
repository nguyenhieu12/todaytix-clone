import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int current = 0;

  List<String> titleCarousel = [
    "Football",
    "School",
    "Grocery store",
  ];
  List<String> subtitleCarousel = [
    "I want to play football",
    "I go to school by bus everyday",
    "I want to go to grocery store with my mother at weekend",
  ];

  List<String> items = [
    "All",
    "Watchlist",
    "Lottery & Rush",
    "Date",
    "No-fee",
    "Musicals",
    "Plays",
    "Matinee",
    "Evening"
  ];

  int itemsLength(String item) {
    if (item == "All") {
      return item.length + 40;
    } else if (item == "Watchlist") {
      return item.length + 80;
    } else if (item == "Lottery & Rush") {
      return item.length + 110;
    } else if (item == "Date") {
      return item.length + 50;
    } else if (item == "No-fee") {
      return item.length + 65;
    } else if (item == "Musicals") {
      return item.length + 80;
    } else if (item == "Plays") {
      return item.length + 60;
    } else if (item == "Matinee") {
      return item.length + 70;
    }
    return item.length + 70;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [0,1,2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/$i.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), // left top right bottom
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleCarousel[i],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ), //Textstyle
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              subtitleCarousel[i],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                /// CUSTOM TABBAR
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: itemsLength(items[index]).toDouble(),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.white
                                      : const Color.fromRGBO(64, 61, 70, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        color: current == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),

                Container(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
                      },
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/1.png'),
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
                                    child: Icon(Icons.bookmark_border, size: 20, color: Colors.white,),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Container()));
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 20,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Icon(CupertinoIcons.location_solid, color: Colors.black,),
                                title: Text("BOS"),
                              )
                            ),
                          ),
                        ),
                      ],
                    ),*/
