import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/ticket_screen.dart';
import 'package:flutter_project/widgets/seat.dart';
import 'package:get/get.dart';

import '../model/movie.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({
    super.key,
    required this.movie,
    required this.day,
    required this.month,
    required this.year,
    required this.time,
  });

  final Movie movie;
  final String day;
  final String month;
  final String year;
  final String time;


  @override
  State<SeatScreen> createState() => _SeatScreen(
      this.movie,
      this.day,
      this.month,
      this.year,
      this.time
  );
}

class _SeatScreen extends State<SeatScreen> {
  _SeatScreen(
      this.movie,
      this.day,
      this.month,
      this.year,
      this.time
  );

  final Movie movie;
  final String day;
  final String month;
  final String year;
  final String time;

  int ticketnum = 1;
  int seatSelectedNum = 0;
  String listSeat = "";

  void addTicket() {
    setState(() {
      ticketnum++;
    });
  }

  final selectedSeat = ValueNotifier<List<String>>([]);

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
          Container(
            color: Color.fromRGBO(238, 238, 238, 1),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text('Select seats',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                ),
                ValueListenableBuilder<List<String>>(
                  valueListenable: selectedSeat,
                  builder: (context, value, _) {
                    return SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            alignment: Alignment.center,
                            child: Text(
                              "Screen",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20,),
                          /// lets make 8 seat horizontal
                          /// and 6 seat vertical
                          for (int i = 1; i <= 8; i++) ...[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int j = 1; j <= 8; j++) ...[
                                  SeatWidget(
                                    seatNumber: "${String.fromCharCode(i + 64)}$j",
                                    width: (MediaQuery.of(context).size.width -
                                        48 -
                                        66) /
                                        8,
                                    height: (MediaQuery.of(context).size.width -
                                        48 -
                                        66) /
                                        8,
                                    isAvailable: i != 8,
                                    isSelected: value.contains(
                                      "${String.fromCharCode(i + 64)}$j",
                                    ),
                                    onTap: () {
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
                                      }
                                      else {
                                        if (value.contains(
                                          "${String.fromCharCode(i + 64)}$j",
                                        )) {
                                          selectedSeat.value = List.from(value)
                                            ..remove(
                                              "${String.fromCharCode(i + 64)}$j",
                                            );
                                        } else {
                                          selectedSeat.value = List.from(value)
                                            ..add(
                                              "${String.fromCharCode(i + 64)}$j",
                                            );
                                          listSeat = listSeat + '${String.fromCharCode(i + 64)}$j ';
                                        }
                                      }
                                    },
                                  ),
                                  // make gap, and in the center wider gap
                                  if (i != 10) SizedBox(width: j == 4 ? 16 : 4)
                                ]
                              ],
                            ),
                            if (i != 9) const SizedBox(height: 6)
                          ],
                          SizedBox(height: 20,),
                          const SeatInfoWidget(),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100)
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Text('  Number of tickets: ',
                      style: TextStyle(
                          fontSize: 17
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
                        style: const TextStyle(color: Colors.black, fontSize: 18)
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            ValueListenableBuilder<List<String>>(
                              valueListenable: selectedSeat,
                              builder: (context, value, _) {
                                return Text(
                                  "\$${value.length * 10}",
                                  style:
                                  Theme.of(context).textTheme.headlineSmall,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => TicketScreen(movie: movie, day: day, month: month, year: year, time: time, listSeat: listSeat,));
                          },
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(250, 50),
                              backgroundColor: Colors.redAccent,
                              textStyle:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}