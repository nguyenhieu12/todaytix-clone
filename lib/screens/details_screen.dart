import 'dart:ui';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/cast.dart';
import 'package:flutter_project/widgets/star_icon_display.dart';
import 'package:flutter_project/widgets/tab_builder.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../api/api.dart';
import '../api/api_service.dart';
import '../controllers/movies_controller.dart';
import '../model/movie.dart';
import '../model/utils.dart';
import 'calendar_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          CalendarScreen(movie: movie),
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
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          // physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                InkWell(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * (1 - 0.63),
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      Api.imageBaseUrl + movie.backdropPath,
                      width: Get.width,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, __, ___) {
                        if (___ == null) return __;
                        return FadeShimmer(
                          width: Get.width,
                          height: 250,
                          highlightColor: const Color(0xff22272f),
                          baseColor: const Color(0xff20252d),
                        );
                      },
                      errorBuilder: (_, __, ___) => const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.broken_image,
                          size: 250,
                        ),
                      ),
                    ),
                    /*child: CachedNetworkImage(
                          imageUrl: info.backdrops,
                          fit: BoxFit.cover,
                        ),*/
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CreateIcons(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Get.put(MoviesController())
                                            .addToWatchList(movie);
                                      },
                                      icon: Obx(
                                            () => Get.put(MoviesController())
                                            .isInWatchList(movie)
                                            ? const Icon(
                                          Icons.bookmark,
                                          color: Colors.red,
                                        )
                                            : const Icon(
                                          Icons.bookmark_outline,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CreateIcons(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.share,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            BottomInfoSheet(child: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/' +
                                  movie.posterPath,
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                              loadingBuilder: (_, __, ___) {
                                if (___ == null) return __;
                                return const FadeShimmer(
                                  width: 110,
                                  height: 140,
                                  highlightColor: Color(0xff22272f),
                                  baseColor: Color(0xff20252d),
                                );
                              },
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              child: Text(
                                "  Upcoming  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              movie.title +
                                  " (" +
                                  movie.releaseDate.split('-')[0] +
                                  ')',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                IconTheme(
                                  data: const IconThemeData(
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  child: StarDisplay(
                                    value:
                                    ((movie.voteAverage * 5) / 10).round(),
                                  ),
                                ),
                                Text(
                                    "  " + movie.voteAverage.toString() + "/10",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const TabBar(
                            indicatorWeight: 4,
                            labelColor: Colors.red,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.redAccent,
                            unselectedLabelColor: Colors.grey,
                            isScrollable: true,
                            tabs: [
                              Tab(
                                text: 'Info',
                              ),
                              Tab(
                                text: 'Similar',
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 450,
                        child: TabBarView(children: [
                          Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About ' + movie.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReadMoreText(
                                    movie.overview,
                                    trimLines: 4,
                                    colorClickableText: Colors.black,
                                    moreStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    lessStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '\nRead More',
                                    trimExpandedText: '\nShow less',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                          leading: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.redAccent,
                                          ),
                                          title: Text(
                                            'Release Date',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          subtitle: Text(movie.releaseDate),
                                        ),
                                        ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                          leading: Icon(
                                            Icons.emoji_emotions_outlined,
                                            color: Colors.redAccent,
                                          ),
                                          title: Text(
                                            'Genres',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          subtitle: Text(Utils.getGenres(movie)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          FutureBuilder<List<Movie>?>(
                            future: ApiService.getSimilarMovie(movie.id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  // shrinkWrap: true,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15.0,
                                    mainAxisSpacing: 15.0,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemCount: 6,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      DetailsScreen(
                                                          movie: snapshot
                                                              .data![index]))));
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}',
                                            height: 300,
                                            width: 180,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                            const Icon(
                                              Icons.broken_image,
                                              size: 180,
                                            ),
                                            loadingBuilder: (_, __, ___) {
                                              if (___ == null) return __;
                                              return const FadeShimmer(
                                                width: 180,
                                                height: 250,
                                                highlightColor: Color(0xff22272f),
                                                baseColor: Color(0xff20252d),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'From \$10',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Save 26%',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      route(),
                    );
                  },
                  child: Text('Get tickets'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(250, 50),
                      backgroundColor: Colors.redAccent,
                      textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateIcons extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const CreateIcons({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: InkWell(onTap: onTap, child: child),
          )),
    );
  }
}

class BottomInfoSheet extends StatelessWidget {
  final List<Widget> child;
  final double? minSize;
  const BottomInfoSheet({
    Key? key,
    required this.child,
    this.minSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: minSize == null ? 0.65 : minSize!,
          minChildSize: minSize == null ? 0.65 : minSize!,
          maxChildSize: 0.86,
          builder: (context, con) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    controller: con,
                    children: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}