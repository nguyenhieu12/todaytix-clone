import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key, required this.movie});

  final Movie movie;

  @override
  State<SeatScreen> createState() => _SeatScreen(this.movie);
}

class _SeatScreen extends State<SeatScreen> {
  _SeatScreen(this.movie);

  final Movie movie;

  var listState = [false, false, false, false, false, false, false, false, false, false, false, false];

  int ticketnum = 1;
  int seatSelectedNum = 0;
  String listSeat = "";

  void addTicket() {
    setState(() {
      ticketnum++;
    });
  }

  void removeTicket() {
    setState(() {
      ticketnum--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title,
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Select seats',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              children: [
                Text('1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                SizedBox(width: 80),
                Text('2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                SizedBox(width: 80),
                Text('3',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                SizedBox(width: 80),
                Text('4',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('A',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[0] = true;
                        });
                        listSeat = listSeat + 'A1';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[0] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                        //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[1] = true;
                        });
                        listSeat = listSeat + 'A2';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[1] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[2] = true;
                        });
                        listSeat = listSeat + 'A3';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[2] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[3] = true;
                        });
                        listSeat = listSeat + 'A4';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[3] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('B',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[4] = true;
                        });
                        listSeat = listSeat + 'B1';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[4] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[5] = true;
                        });
                        listSeat = listSeat + 'B2';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[5] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[6] = true;
                        });
                        listSeat = listSeat + 'B3';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[6] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[7] = true;
                        });
                        listSeat = listSeat + 'B4';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[7] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('C',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[8] = true;
                        });
                        listSeat = listSeat + 'C1';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[8] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[9] = true;
                        });
                        listSeat = listSeat + 'C2';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[9] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[10] = true;
                        });
                        listSeat = listSeat + 'C3';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[10] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 70),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      seatSelectedNum++;
                      if(seatSelectedNum > ticketnum) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('The number of seats cannot be greater than the number of tickets!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                        );
                        seatSelectedNum--;
                      } else {
                        setState(() {
                          listState[11] = true;
                        });
                        listSeat = listSeat + 'C4';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: listState[11] ? Colors.blue : Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 65),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Available',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: BorderSide(width: 3, color: Colors.blue)
                      //shape: ,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Selection',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              Text('Number of tickets: ',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              IconButton(
                  onPressed: () {
                    if(ticketnum >= 2)
                      removeTicket();
                  },
                  icon: const Icon(Icons.remove_circle_outline,
                      color: Colors.blueGrey,
                      size: 25
                  ),
                  style: ButtonStyle()
              ),
              Text('$ticketnum ticket(s)',
                  style: const TextStyle(color: Colors.black, fontSize: 19)
              ),
              IconButton(
                  onPressed: addTicket,
                  icon: const Icon(Icons.add_circle_outline,
                      color: Colors.blueGrey,
                      size: 25,
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}