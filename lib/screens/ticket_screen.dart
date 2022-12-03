import 'dart:ui';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../model/movie.dart';
import '../model/utils.dart';
import '../widgets/star_icon_display.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({
    super.key,
    required this.movie,
    required this.day,
    required this.month,
    required this.year,
    required this.time,
    required this.listSeat
  });

  final Movie movie;
  final String day;
  final String month;
  final String year;
  final String time;
  final String listSeat;

  @override
  State<TicketScreen> createState() => _TicketScreen(
      this.movie,
      this.day,
      this.month,
      this.year,
      this.time,
      this.listSeat
  );
}

class _TicketScreen extends State<TicketScreen> {
  _TicketScreen(
      this.movie,
      this.day,
      this.month,
      this.year,
      this.time,
      this.listSeat
   );

  final Movie movie;
  final String day;
  final String month;
  final String year;
  final String time;
  final String listSeat;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        title: Text('Your ticket',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TicketWidget(
                    width: 350,
                    height: 440,
                    isCornerRounded: true,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[3],
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          movie.posterPath,
                                      width: 120,
                                      height: 180,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (_, __, ___) {
                                        if (___ == null) return __;
                                        return const FadeShimmer(
                                          width: 55,
                                          height: 70,
                                          highlightColor: Color(0xff22272f),
                                          baseColor: Color(0xff20252d),
                                        );
                                      },
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 18,
                                      child: Text(
                                        "  Upcoming  ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      movie.title +
                                          " (" +
                                          movie.releaseDate.split('-')[0] +
                                          ')',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        IconTheme(
                                          data: const IconThemeData(
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                          child: StarDisplay(
                                            value:
                                            ((movie.voteAverage * 5) / 10).round(),
                                          ),
                                        ),
                                        Text(
                                            "  " + movie.voteAverage.toString() + "/10",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      Utils.getGenres(
                                          movie),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ticketDetailsWidget(
                                  'Time', '$time', 'Date', int.parse(day) < 10 ? '0$day/$month/$year' : '$day/$month/$year'),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, right: 18.0),
                                child: ticketDetailsWidget('Theater', 'CGV', 'Seat', '$listSeat'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                          child: Container(
                            child: BarcodeWidget(
                              height: 70,
                              data: '${movie.id}',
                              barcode: Barcode.codabar(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => HomeScreen());
              },
              child: Text('Back to home'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(250, 50),
                  backgroundColor: Colors.redAccent,
                  textStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          )
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}