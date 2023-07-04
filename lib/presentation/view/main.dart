import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider<MovieViewModel>(
      create: (_) => GetIt.instance<MovieViewModel>(),
      child: const MaterialApp(
        home: MovieScreen(),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Consumer<MovieViewModel>(
        builder: (context, movieViewModel, _) {
          return Column(
            children: [
              TextField(
                controller: textEditingController,
              ),
              ElevatedButton(
                  onPressed: () { _handleSearch(movieViewModel);},
                  child: const Text("load")),
              for (var movie
                  in movieViewModel.movies?.boxOfficeResult.dailyBoxOfficeList ?? const Iterable.empty())
                Text(movie.movieNm)
            ],
          );
        },
      ),
    );
  }
}
