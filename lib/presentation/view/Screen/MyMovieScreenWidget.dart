import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../di/module.dart';

class MyMovieScreenWidget extends HookConsumerWidget {
  const MyMovieScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    useEffect(() {
      viewModel.fetchDatabase();
      return null;
    }, []);
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
              index: index
          );
        },
      ),
    );
  }
}

class MyMovieItem extends HookConsumerWidget {
  const MyMovieItem({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(onPressed: () {viewModel.deleteMovie(index);}, icon: const Icon(Icons.delete)),
          Text(viewModel.myMovie[index].movieNm),
        ],
      ),
    );
  }
}
