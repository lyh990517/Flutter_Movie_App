import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/BoxOffice.dart';
import '../Screen/MovieDetailWidget.dart';

class MovieItem extends HookConsumerWidget {
  const MovieItem({
    Key? key,
    required this.onClick,
    required this.index,
    required this.movie
  }) : super(key: key);

  final BoxOffice? movie;
  final void Function() onClick;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crawler = ref.watch(moviePosterCrawlerProvider);
    return GestureDetector(
      onTap: () {
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
              FutureBuilder<String>(
                future: crawler.crawl(movie?.movieNm ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        width: 150,
                        height: 200,
                        child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Image.network(
                      "https://fastly.picsum.photos/id/211/200/300.jpg?hmac=wrwgBoS1KPKiLCrxowMtMQ7NpVlzI1NvocRSpH6HSm0",
                      width: 150,
                      height: 200,
                      fit: BoxFit.fill,
                    );
                  } else {
                    final imageUrl = snapshot.data ?? "";
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        imageUrl,
                        width: 150,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                },
              ),
              Text(movie?.movieNm ?? "",style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15),maxLines: 2,textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}

