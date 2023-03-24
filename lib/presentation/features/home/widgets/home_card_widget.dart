import 'package:flutter/material.dart';
import 'package:movie_flutter/data/models/movie_result.dart';
import 'package:movie_flutter/presentation/features/home/home_constant.dart';

class HomeCardWidget extends StatelessWidget {
  final MovieResult movieResult;
  const HomeCardWidget({super.key, required this.movieResult});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final date = DateTime.parse(movieResult.releaseDate.toString());
    final year = date.year;

    return Container(
      decoration: BoxDecoration(
        borderRadius: HomeConstant.borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: HomeConstant.spreadRadius,
            blurRadius: HomeConstant.blurRadius,
            offset: HomeConstant.offset, // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: HomeConstant.borderRadius,
            child: Image.network(
              '${HomeConstant.urlImage}${movieResult.backdropPath}',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          _contentCard(year, size),
          _rankCard(),
        ],
      ),
    );
  }

  Widget _rankCard() {
    return Positioned(
      right: HomeConstant.kPositionedRight,
      top: HomeConstant.kPositionedTop,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: HomeConstant.gradient,
        ),
        child: CircleAvatar(
          radius: HomeConstant.kSize15, // Im
          backgroundColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieResult.voteAverage.toString().split('.').first,
                style: const TextStyle(fontSize: HomeConstant.kSize18),
              ),
              const Text('.'),
              Text(movieResult.voteAverage.toString().split('.').last,
                  style: const TextStyle(fontSize: HomeConstant.kSize12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentCard(int year, Size size) {
    return Positioned(
      left: HomeConstant.kPositionedLeft,
      bottom: HomeConstant.kPositionedBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year.toString(),
            style: const TextStyle(
                color: Colors.white70, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: HomeConstant.kSize5,
          ),
          SizedBox(
            width: size.width / HomeConstant.kSize3,
            child: Text(
              movieResult.originalTitle ?? '',
              maxLines: HomeConstant.kSize2,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
