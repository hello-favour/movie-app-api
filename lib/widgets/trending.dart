// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
                  onTap: () {},
                  child: Container(
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
                        Container(
                          child: AppText(
                              text: trending[index]["title"] != null
                                  ? trending[index]["title"]
                                  : "loading"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
