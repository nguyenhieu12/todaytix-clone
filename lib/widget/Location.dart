import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(102, 98, 161, 100), Colors.black],),),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
              title: const Text(
                'Select Location',
                style: TextStyle(color: Colors.white),
              ),),
          body: Center(
            child: LocationList(update: () {  },),
          ),
        ),);
  }
}

class LocationList extends StatefulWidget {
  final Function() update;
  const LocationList({super.key, required this.update});

  @override
  State<LocationList> createState() => ListState(choice: '');
}

class ListState extends State<LocationList> {
  ListState({key, required this.choice});

  String choice;

  final List<String> areas = <String>[
    'Boston',
    'Chicago',
    'Connecticut',
    'Dallas + Fort Worth',
    'Houston',
    'London',
    'Los Angeles + OC',
    'Melbourne',
    'New York',
    'Philadelphia',
    'SF Bay Area',
    'Seattle',
    'Sydney',
    'Toronto',
    'Washington DC',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 5);
      },
      itemCount: 15,
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Center(
              child: Text(
            areas[index],
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),),
          onTap: () {
            setState(() => choice == areas[index]);
            widget.update();
            Navigator.pop(
              context,
            );
          },
        );
      },
    );
  }
}
