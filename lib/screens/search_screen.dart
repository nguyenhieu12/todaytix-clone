import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

import '../model/show_model.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /*final controller = TextEditingController();*/

  static List<Show> allShows = [
    Show(
      title: "Gaylarious: Comedy Laugh Festival",
      subtitle: "From 12",
      urlImage: "assets/1.jfif",
    ),
    Show(
      title: "Chamber Magic",
      subtitle: "",
      urlImage: "assets/2.jfif",
    ),
    Show(
      title: "Drunk Shakespeare",
      subtitle: "From 45",
      urlImage: "assets/3.jfif",
    ),
    Show(
      title: "Merrily We Roll Along",
      subtitle: "",
      urlImage: "assets/4.jfif",
    )
  ];

  List<Show> displayShow = List.from(allShows);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            /*controller: controller,*/
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.white,),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                hintText: "Search for shows in New York",
            ),
            onChanged: searchShow,
          ),
          const SizedBox(height: 20,),
          SizedBox(
                height: 100000,
                  child: displayShow.isNotEmpty
                      ? ListView.builder(
                      itemCount: displayShow.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              leading: Image.asset(
                                displayShow[index].urlImage,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 100,
                              ),
                              title: Column(
                                children: [
                                  Text(
                                    displayShow[index].title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    displayShow[index].subtitle,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen())),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                  )
                  : const Text(
                    'Sorry, no results found.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
              )
        ],
      ),
    );
  }

  void searchShow(String query) {
    setState(() => displayShow = allShows.where(
        (show) => show.title.toLowerCase().contains(query.toLowerCase()),
    ).toList(),);
  }
}
