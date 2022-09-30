import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'detailsPage.dart';

class HomePage extends StatelessWidget {
  /// List of Tab Bar Item
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

  List<String> items_ = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Colors.black87,*/
      body: Container(
        /*width: double.infinity,
        height: double.infinity,*/
        color: Colors.black87,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 300.0),
              items: [1,2,3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image.asset('assets/$i.jpg')
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          selectionColor: Colors.white,
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            CardItem(image: 'assets/1.jpg', context: context),
            CardItem(image: 'assets/2.jpg', context: context),
            CardItem(image: 'assets/3.jpg', context: context),
          ],
        ),
      ),
    );
  }

  Widget CardItem({image, context}) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
        },
        child: Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.bookmark_border, size: 20,),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}