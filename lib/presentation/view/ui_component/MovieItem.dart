import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:flutter_mvvm/utils/ImageUtil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/BoxOffice.dart';
import '../Screen/MovieDetailWidget.dart';

class MovieItem extends HookConsumerWidget {
  const MovieItem({
    Key? key,
    required this.onSelect,
    required this.onClick,
    required this.index,
    required this.movie
  }) : super(key: key);

  final BoxOffice? movie;
  final void Function() onSelect;
  final void Function() onClick;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crawler = ref.watch(moviePosterCrawlerProvider);
    return GestureDetector(
      onTap: () {
        onSelect();
        onClick();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MovieDetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              posterImage(crawler, movie,150.0,0),
              Text(movie?.movieNm ?? "",style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15,color: Colors.white),maxLines: 2,textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}

