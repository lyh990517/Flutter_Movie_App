import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/BoxOffice.dart';
import 'MoviePosterCrawler.dart';

Widget posterImage(
    MoviePosterCrawler crawler, BoxOffice? movies, double width) {
  final movieName = movies?.movieNm;
  return FutureBuilder<String>(
    future: crawler.crawl(movieName ?? ""),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Image.network(
          "https://fastly.picsum.photos/id/211/200/300.jpg?hmac=wrwgBoS1KPKiLCrxowMtMQ7NpVlzI1NvocRSpH6HSm0",
          fit: BoxFit.fill,
        );
      } else {
        final imageUrl = snapshot.data ?? "";
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            width: width,
            imageUrl,
            fit: BoxFit.fill,
          ),
        );
      }
    },
  );
}
