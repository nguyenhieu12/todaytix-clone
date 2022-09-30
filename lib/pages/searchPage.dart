import 'package:flutter/material.dart';

List<String> items = [
  "Under 49",
  "Under 79",
  "Under 99",
];

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                            hintText: "Search fors shows in New York"
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
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
                  ]
              )
          )
      )
    );
  }
}