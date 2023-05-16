// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/screens/description_screen.dart';

import 'package:movie_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  var toprated = [];
  TopRatedMovies({
    Key? key,
    required this.toprated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: "Top Rated Movies",
            size: 30,
          ),
          const SizedBox(height: 15),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DescriptionScreen(
                        name: toprated[index]["titile"],
                        bannerurl:
                            "https://image.tmdb.org/t/p/w500${toprated[index]["backdrop_path"]}",
                        posterurl:
                            "https://image.tmdb.org/t/p/w500${toprated[index]["poster_path"]}",
                        description: toprated[index]["overview"],
                        launch_on: toprated[index]["release_date"],
                        vote: toprated[index]["vote_average"].toString(),
                      );
                    }));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${toprated[index]["poster_path"]}"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: AppText(
                              text: toprated[index]["title"] != null
                                  ? toprated[index]["title"]
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
