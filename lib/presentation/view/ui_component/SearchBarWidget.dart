import 'package:flutter/material.dart';

import '../../viewmodel/MovieViewModel.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.textEditingController,
    required this.viewModel,
  });

  final TextEditingController textEditingController;
  final MovieViewModel viewModel;

  void _handleSearch(MovieViewModel viewModel) {
    final searchText = textEditingController.text;
    viewModel.getMovieList(searchText, "20");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
              _handleSearch(viewModel);
            },
            child: const Text("load"))
      ],
    );
  }
}
