import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../data/model/BoxOfficeResponse.dart';
import '../../data/network/MovieService.dart';

class MovieViewModel extends ChangeNotifier {
  late BoxOfficeResponse _movies;

  BoxOfficeResponse get movies => _movies;

  MovieService myService = GetIt.instance<MovieService>();

  Future<void> fetchPosts(String targetDt, String itemPerPage) async {
    try {
      BoxOfficeResponse fetchedPosts =
          await myService.getDailyBoxOfficeList(targetDt, itemPerPage);
      _movies = fetchedPosts;
      notifyListeners();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }
}
