import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../di/module.dart';
import '../viewmodel/MovieViewModel.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GetIt.instance<MovieViewModel>(),
      child: MaterialApp(
        home: const MovieScreen(),
        theme: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      ),
    );
  }
}

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    void _handleSearch(MovieViewModel viewModel) {
      final searchText = textEditingController.text;
      viewModel.fetchPosts(searchText, "20");
    }

    String formatDate() {
      if (textEditingController.text.isNotEmpty) {
        DateTime date = DateTime.parse(textEditingController.text);
        final formatter = DateFormat('yyyy년 MM월 dd일');
        return formatter.format(date);
      } else {
        return "";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Consumer<MovieViewModel>(
        builder: (context, movieViewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      decoration: const InputDecoration(hintText: "20230101"),
                      controller: textEditingController,
                    ),
                  )),
                  ElevatedButton(
                      onPressed: () {
                        _handleSearch(movieViewModel);
                      },
                      child: const Text("load"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("검색 일자: ${formatDate()}"),
              ),
              Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: movieViewModel
                        .movies?.boxOfficeResult.dailyBoxOfficeList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MovieItem(
                          movie: movieViewModel.movies?.boxOfficeResult
                              .dailyBoxOfficeList[index],
                        ),
                      );
                    },
                  ))
            ],
          );
        },
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final BoxOffice? movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movie)));
      },
      child: Container(
        color: Colors.greenAccent,
        child: Row(
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
                    movie!.movieNm,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${movie!.rank} 위"),
                      const SizedBox(width: 10),
                      Text("개봉 일자: ${movie!.openDt}")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});

  final BoxOffice? movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: WebView(
              initialUrl:
                  "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${movie!.movieNm}"),
        ),
      ]),
      appBar: AppBar(
        title: Text(movie!.movieNm),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
