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
        height: 300,
        color: Colors.greenAccent,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.movie),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].movieNm ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].rank}위"),
                      const SizedBox(width: 10),
                      Text("개봉 일자: ${viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].openDt}"),
                    ],
                  ),
                  FutureBuilder<String>(
                    future: crawler.crawl(viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index].movieNm ?? ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final imageUrl = snapshot.data ?? "";
                        return Image.network(imageUrl);
                      }
                    },
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

