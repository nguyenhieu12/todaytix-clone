import 'package:flutter/material.dart';
import 'package:flutter_project/model/movie.dart';

class SuccessScreen extends StatefulWidget {
  String selectedDate;
  String selectedTime;
  Movie movie;
  int ticketNum;
  String listSeat;

  SuccessScreen({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
    required this.movie,
    required this.ticketNum,
    required this.listSeat
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState(
      this.selectedDate,
      this.selectedTime,
      this.movie,
      this.ticketNum,
      this.listSeat
  );
}

class _SuccessScreenState extends State<SuccessScreen> {
  String selectedDate;
  String selectedTime;
  Movie movie;
  int ticketNum;
  String listSeat;

  _SuccessScreenState(
      this.selectedDate,
      this.selectedTime,
      this.movie,
      this.ticketNum,
      this.listSeat
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Movie information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
