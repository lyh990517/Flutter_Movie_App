import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../di/module.dart';

class MyMovieItem extends HookConsumerWidget {
  const MyMovieItem({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    final crawler = ref.watch(moviePosterCrawlerProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FutureBuilder<String>(
            future: crawler.crawl(viewModel.myMovie[index].movieNm ?? ""),
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
          Row(
            children: [
              Text(viewModel.myMovie[index].movieNm ,style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15),maxLines: 2,textAlign: TextAlign.center),
              IconButton(onPressed: () {viewModel.deleteMovie(index);}, icon: const Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}
