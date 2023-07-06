import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/presentation/viewmodel/MovieViewModel.dart';
import 'package:provider/provider.dart';

class MyMovieScreenWidget extends StatefulWidget {
  const MyMovieScreenWidget({super.key, required this.viewModel});

  final MovieViewModel viewModel;

  @override
  State<MyMovieScreenWidget> createState() => _MyMovieScreenWidgetState();
}

class _MyMovieScreenWidgetState extends State<MyMovieScreenWidget> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("My Movies"),
      ),
      body: Consumer<MovieViewModel>(
        builder: (context, movieViewModel, _) {
          final myMovies = movieViewModel.myMovie;

          return ListView.builder(
            itemCount: myMovies.length,
            itemBuilder: (context, index) {
              return MyMovieItem(
                movie: myMovies[index],
                onDelete: () {
                  movieViewModel.deleteMovie(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class MyMovieItem extends StatelessWidget {
  const MyMovieItem({
    super.key,
    required this.movie,
    required this.onDelete,
  });

  final BoxOffice movie;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
          Text(movie.movieNm),
        ],
      ),
    );
  }
}
