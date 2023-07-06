import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/presentation/viewmodel/MovieViewModel.dart';

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
      body: ListView.builder(
        itemCount: widget.viewModel.myMovie.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.viewModel.myMovie[index].movieNm),
          );
        },
      ),
    );
  }
}
