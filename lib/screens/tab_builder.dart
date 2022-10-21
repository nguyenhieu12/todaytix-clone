import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/movie.dart';
import '../screens/details_screen.dart';

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    required this.future,
    Key? key,
  }) : super(key: key);
  final Future<List<Movie>?> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>?>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(movie: snapshot.data![index]));
              },
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}',),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                            child: const Center(
                              child: Icon(Icons.bookmark_border, size: 20, color: Colors.white,),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 7, 20, 5), // left top right bottom,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(64, 61, 70, 1), // 64, 61, 70, 1
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row (
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mean Girls',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ), //Textstyle
                                    ),
                                    Text(
                                      'Opens Oct 11',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ), //Textstyle
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'from 39',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ), //Textstyle
                                    ),
                                    Text(
                                      'Save 26%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ), //Textstyle
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
