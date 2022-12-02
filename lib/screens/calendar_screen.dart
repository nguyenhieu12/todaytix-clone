import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/movie.dart';
import 'seat_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, required this.movie});

  final Movie movie;

  @override
  State<CalendarScreen> createState() => CalendarState(this.movie);
}

class CalendarState extends State<CalendarScreen> {
  CalendarState(this.movie);

  final Movie movie;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  var iniDate = DateTime.now();

  String day = "";
  String month = DateTime.now().month.toString();
  String year = DateTime.now().year.toString();
  String time = "";

  var firstListTime = [
    "8:30 AM ",
    "10:30 AM"
  ];

  var firstSelected = [
    false,
    false,
  ];

  var secondListTime = [
    "3:30 PM ",
    "8:30 PM "
  ];

  var secondSelected = [
    false,
    false
  ];

  @override
  Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SeatScreen(movie: movie),
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(movie.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 280, top: 20),
            child: Text('Select date',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          TableCalendar(
            rowHeight: 50,
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2023, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  day =_selectedDay!.day.toString();
                  month = _selectedDay!.month.toString();
                  year = _selectedDay!.year.toString();
                },
              );
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Text('Select time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for(int i = 0;i < firstSelected.length;i++) {
                          firstSelected[i] = false;
                          secondSelected[i] = false;
                        }
                        firstSelected[0] = true;
                        time = firstListTime[0];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: firstSelected[0] ? Colors.redAccent : Colors.white,
                        shape: const StadiumBorder(),
                        maximumSize: Size.fromWidth(140),
                        side: BorderSide(color: firstSelected[0] ? Colors.redAccent : Colors.grey),
                    ),
                    child: Center(
                      child: Text(firstListTime[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: firstSelected[0] ? Colors.white : Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for(int i = 0;i < firstSelected.length;i++) {
                          firstSelected[i] = false;
                          secondSelected[i] = false;
                        }
                        firstSelected[1] = true;
                        time = firstListTime[1];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: firstSelected[1] ? Colors.redAccent : Colors.white,
                      shape: const StadiumBorder(),
                      maximumSize: Size.fromWidth(140),
                      side: BorderSide(color: firstSelected[1] ? Colors.redAccent : Colors.grey),
                    ),
                    child: Center(
                      child: Text(firstListTime[1],
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: firstSelected[1] ? Colors.white : Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 35),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for(int i = 0;i < secondSelected.length;i++) {
                          secondSelected[i] = false;
                          firstSelected[i] = false;
                        }
                        secondSelected[0] = true;
                        time = secondListTime[0];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondSelected[0] ? Colors.redAccent : Colors.white,
                      shape: const StadiumBorder(),
                      maximumSize: Size.fromWidth(140),
                      side: BorderSide(color: secondSelected[0] ? Colors.redAccent : Colors.grey),
                    ),
                    child: Center(
                      child: Text(secondListTime[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: secondSelected[0] ? Colors.white : Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for(int i = 0;i < secondSelected.length;i++) {
                          secondSelected[i] = false;
                          firstSelected[i] = false;
                        }
                        secondSelected[1] = true;
                        time = secondListTime[1];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondSelected[1] ? Colors.redAccent : Colors.white,
                      shape: const StadiumBorder(),
                      maximumSize: Size.fromWidth(140),
                      side: BorderSide(color: secondSelected[1] ? Colors.redAccent : Colors.grey),
                    ),
                    child: Center(
                      child: Text(secondListTime[1],
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: secondSelected[1] ? Colors.white : Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 60),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    )
                ),
                width: 20,
                height: 20,
              ),
              SizedBox(width: 10),
              Text('Available',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              ),
              SizedBox(width: 50),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent
                ),
                width: 20,
                height: 20,
              ),
              SizedBox(width: 10),
              Text('Selection',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey
          ),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        color: Colors.white,
        child: Stack(
          children: [
            // SizedBox(width: 80),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 15),
              child: Text(day == "" ? '' : (time == "" ? '$day/$month/$year' : '$day/$month/$year - $time'),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 340, top: 5),
              child: TextButton(
                onPressed: () {
                  if(time == "" || day == "") {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text('You must select date and time!'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('Ok'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        )
                    );
                  } else {
                    Navigator.push(context, route());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent
                ),
                child: Image.asset('assets/right_blue_arrow.png',
                  width: 27,
                  height: 27,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Time {
  String time;
  bool isSelected;

  Time({
    required this.time,
    required this.isSelected
  });
}