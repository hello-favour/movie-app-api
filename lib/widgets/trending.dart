// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/screens/description_screen.dart';

import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  var trending = [];
  TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: "Trending Movies",
            size: 30,
          ),
          const SizedBox(height: 15),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DescriptionScreen(
                        name: trending[index]["title"],
                        bannerurl:
                            "https://image.tmdb.org/t/p/w500${trending[index]["backdrop_path"]}",
                        posterurl:
                            "https://image.tmdb.org/t/p/w500${trending[index]["poster_path"]}",
                        description: trending[index]["overview"],
                        vote: trending[index]["vote_average"].toString(),
                        launch_on: trending[index]["release_date"],
                      );
                    }));
                  },
                  child: trending[index]["title"] != null
                      ? Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${trending[index]["poster_path"]}"),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: AppText(
                                    text: trending[index]["title"] != null
                                        ? trending[index]["title"]
                                        : "loading"),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
