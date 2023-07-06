import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../data/model/BoxOffice.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie, required this.onSave});

  final BoxOffice? movie;
  final void Function(BoxOffice movie) onSave;

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
        actions: [IconButton(onPressed: () { onSave(movie!);}, icon: const Icon(Icons.add))],
      ),
    );
  }
}