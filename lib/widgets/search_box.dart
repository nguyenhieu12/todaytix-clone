import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    required this.onSumbit,
    Key? key,
  }) : super(key: key);
  final VoidCallback onSumbit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Get.put(SearchController()).searchController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintText: "Search for shows in New York"),
      onSubmitted: (a) => onSumbit(),
    );
  }
}
