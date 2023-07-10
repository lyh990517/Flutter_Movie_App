import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/presentation/view/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyMovieScreenWidget extends HookConsumerWidget {
  const MyMovieScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);

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
      body: ListView.builder(
        itemCount: viewModel.myMovie.length,
        itemBuilder: (context, index) {
          return MyMovieItem(
            movie: viewModel.myMovie[index],
            onDelete: () {
              viewModel.deleteMovie(index);
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
