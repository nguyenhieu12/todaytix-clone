import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/api.dart';
import 'package:flutter_project/model/cast.dart';
import 'package:get/get.dart';
import '../controllers/movies_controller.dart';
import '../model/movie.dart';
import '../screens/details_screen.dart';

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    required this.future,
    Key? key,
  }) : super(key: key);
  final Future<List<Cast>?> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cast>?>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${Api.imageBaseUrl}${snapshot.data![index].profileURL}'),
                        radius: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${snapshot.data![index].name}',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${snapshot.data![index].character}',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                )),
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