import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../controllers/movies_controller.dart';
import 'details_screen.dart';
import 'location_screen.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => LocaleState();
}

class LocaleState extends State<Watchlist> {
  LocaleState();

  Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LocationPage(),
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
    refresh() {
      setState(() {});
    }

    LocationList(update: refresh);
    final String locale = ListState(choice: '').choice;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(102, 98, 161, 100), Colors.black],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                label: Text(
                  locale,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    route(),
                  );
                },
              ),
            ],
          ),
          body: Obx(() => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(34.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      if (Get.find<MoviesController>()
                          .watchListMovies
                          .isNotEmpty)
                        ...Get.find<MoviesController>()
                            .watchListMovies
                            .map((movie) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(DetailsScreen(movie: movie));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                            .fromLTRB(
                                                        20, 10, 10, 10),
                                                    child: ClipOval(
                                                        child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.5),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Get.put(MoviesController())
                                                              .addToWatchList(
                                                                  movie);
                                                        },
                                                        icon: Obx(
                                                          () => Get.put(
                                                                      MoviesController())
                                                                  .isInWatchList(
                                                                      movie)
                                                              ? const Icon(
                                                                  Icons
                                                                      .bookmark,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .bookmark_outline,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        ),
                                                      ),
                                                    )),
                                                  ),
                                                ]),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20,
                                                7,
                                                20,
                                                5), // left top right bottom,
                                            height: 55,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(64, 61, 70,
                                                  1), // 64, 61, 70, 1
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                              )),
                                              Expanded(
                                                  child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
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
                                              )),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                )),
                      if (Get.find<MoviesController>().watchListMovies.isEmpty)
                        Column(
                          children: const [
                            SizedBox(
                              height: 200,
                            ),
                            Text(
                              'No movies in your watch list',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
