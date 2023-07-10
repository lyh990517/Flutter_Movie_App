import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieDetailScreen extends HookConsumerWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: WebView(
              initialUrl:
              "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${viewModel.selectedMovie?.movieNm}"),
        ),
      ]),
      appBar: AppBar(
        title: Text(viewModel.selectedMovie?.movieNm ?? ""),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [IconButton(onPressed: () { viewModel.saveMovie(viewModel.selectedMovie);}, icon: const Icon(Icons.add))],
      ),
    );
  }
}