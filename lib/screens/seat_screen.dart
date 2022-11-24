import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  State<SeatScreen> createState() => SeatSelector();
}

class SeatSelector extends State<SeatScreen> {
  int ticketnum = 1;

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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Choose Your Seat',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: PhotoView(
            imageProvider: AssetImage("assets/seating.png"),
          ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              IconButton(onPressed: removeTicket,
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.blueGrey,),
                  style: ButtonStyle()),
              Text('$ticketnum ticket(s)', style: const TextStyle(color: Colors.black, fontSize: 16)),
              IconButton(onPressed: addTicket, icon: const Icon(Icons.add_circle_outline, color: Colors.blueGrey,)),
            ],
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            height: 10,
            thickness: 1,
            color: Colors.grey,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          Text('Standard', style: TextStyle(fontSize: 16, color: Colors.black)),
                          Text('Cyber Sale', style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
                        ]
                    ),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:const [
                          Text('From \$39 ea', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                          Text('Save 35%', style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold)),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){},
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      )
      );
  }
}