import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../viewmodel/MovieViewModel.dart';

class SearchBarWidget extends HookConsumerWidget {
  const SearchBarWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  void _handleSearch(MovieViewModel viewModel) {
    final searchText = textEditingController.text;
    viewModel.getMovieList(searchText, "20");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
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
