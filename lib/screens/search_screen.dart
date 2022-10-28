import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../controllers/search_controller.dart';
import '../model/movie.dart';
import '../model/utils.dart';
import 'details_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import '../widgets/search_box.dart';
import 'signup_screen.dart';
import 'watchlist_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: mHeight,
        width: mWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(71, 71, 90, 1),
            Color.fromRGBO(28, 28, 33, 1),
          ], begin: Alignment.topRight),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SearchBox(
                  onSumbit: () {
                    String search =
                        Get.put(SearchController()).searchController.text;
                    Get.put(SearchController()).searchController.text = '';
                    Get.put(SearchController()).search(search);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  (() => Get.put(SearchController()).isLoading.value
                      ? const CircularProgressIndicator()
                      : Get.put(SearchController()).foundedMovies.isEmpty
                          ? SizedBox(
                              width: Get.width / 1.5,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Sorry, no result found!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Get.put(SearchController())
                                            .foundedMovies
                                            .length
                                            .toString() +
                                        ' results',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  ListView.separated(
                                      itemCount: Get.put(SearchController())
                                          .foundedMovies
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 20),
                                      itemBuilder: (_, index) {
                                        Movie movie =
                                            Get.put(SearchController())
                                                .foundedMovies[index];
                                        return GestureDetector(
                                          onTap: () => Get.to(
                                              DetailsScreen(movie: movie)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.network(
                                                  Api.imageBaseUrl +
                                                      movie.posterPath,
                                                  height: 180,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (_, __, ___) =>
                                                      const Icon(
                                                    Icons.broken_image,
                                                    size: 120,
                                                  ),
                                                  loadingBuilder: (_, __, ___) {
                                                    if (___ == null) return __;
                                                    return const FadeShimmer(
                                                      width: 120,
                                                      height: 180,
                                                      highlightColor:
                                                          Color(0xff22272f),
                                                      baseColor:
                                                          Color(0xff20252d),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              SizedBox(
                                                height: 180,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        movie.title,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .star,
                                                              color: Color(
                                                                  0xFFFF8700),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              movie.voteAverage ==
                                                                      0.0
                                                                  ? 'N/A'
                                                                  : movie
                                                                      .voteAverage
                                                                      .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                                color: Color(
                                                                    0xFFFF8700),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .ticket,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              Utils.getGenres(
                                                                  movie),
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .calendar,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              movie.releaseDate
                                                                  .split(
                                                                      '-')[0],
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      })
                                ],
                              ),
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 1),
    );
  }
}
