import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = "c3c3360b360e31966a256dec08197a8e";
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjM2MzMzYwYjM2MGUzMTk2NmEyNTZkZWMwODE5N2E4ZSIsInN1YiI6IjY0NjE3OTJiZGJiYjQyMDExOWY1MTBlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f_Eg_ZBpK21CWw34ZlKdbOnUYzbaT01_ss3ugiCGitA";

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMovies = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult["result"];
      topRatedMovies = topRatedMovies["result"];
      tv = tvResult["result"];
    });
    print(trendingMovies);
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter movie app"),
      ),
    );
  }
}
