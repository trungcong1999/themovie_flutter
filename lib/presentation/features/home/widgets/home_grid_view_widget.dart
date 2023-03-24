import 'package:flutter/material.dart';
import 'package:movie_flutter/data/models/movie_result.dart';

import '../home_constant.dart';
import 'home_card_widget.dart';

class HomeGridViewWidget extends StatelessWidget {
  const HomeGridViewWidget({super.key, required this.movies, required this.scrollController});

  final List<MovieResult> movies;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: HomeConstant.crossAxisCount,
          childAspectRatio: size.width /
              (size.height / HomeConstant.ratioChildAspectRatioHeight),
          crossAxisSpacing: HomeConstant.crossAxisCountSpacing,
          mainAxisSpacing: HomeConstant.crossAxisCountSpacing,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final data = movies[index];
          return HomeCardWidget(movieResult: data);
        },
      ),
    );
  }
}
