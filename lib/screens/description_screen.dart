import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';

class DescriptionScreen extends StatelessWidget {
  final String? name;
  final String? description;
  final String? bannerurl;
  final String? posterurl;
  final String? vote;
  final String? launch_on;
  const DescriptionScreen({
    super.key,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlack,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
