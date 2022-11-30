import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../model/movie.dart';

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var upComingMovies = <Movie>[].obs;
  var watchListMovies = <Movie>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    upComingMovies.value = (await ApiService.getUpcomingMovies())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Movie movie) {
    return watchListMovies.any((m) => m.id == movie.id);
  }

  void addToWatchList(Movie movie) {
    if (watchListMovies.any((m) => m.id == movie.id)) {
      watchListMovies.remove(movie);
    } else {
      watchListMovies.add(movie);
      Get.snackbar('Success', 'Added to Watchlist',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          icon: Icon(
            CupertinoIcons.bookmark_fill,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          animationDuration: const Duration(milliseconds: 700),
          duration: const Duration(milliseconds: 700));
    }
  }
}
