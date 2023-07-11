import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Screen/MovieDetailWidget.dart';

class MovieItem extends HookConsumerWidget {
  const MovieItem({
    Key? key,
    required this.onClick,
    required this.index,
  }) : super(key: key);

  final void Function() onClick;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    final crawler = ref.watch(moviePosterCrawlerProvider);

    return GestureDetector(
      onTap: () {
        onClick();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailScreen()),
        );
      },
      child: Container(
        color: Colors.greenAccent,
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String>(
                    future: crawler.crawl(viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].movieNm ?? ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final imageUrl = snapshot.data ?? "";
                        return Image.network(imageUrl,width: 150, height: 200, fit: BoxFit.fill,);
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].movieNm ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

