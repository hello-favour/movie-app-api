import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/utils/text.dart';

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
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: AppText(text: "🌟 Average Rating - ${vote}"))
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              child: AppText(
                text: name != null ? name.toString() : "Not loaded",
                size: 24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: AppText(
                text: "Releasing on - ${launch_on}",
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(
                    posterurl.toString(),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: AppText(
                      text: description.toString(),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
