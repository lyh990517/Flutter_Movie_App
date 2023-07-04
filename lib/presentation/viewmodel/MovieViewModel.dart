import 'package:flutter/cupertino.dart';
import '../../data/model/BoxOfficeResponse.dart';
import '../../data/network/Api.dart';

class MovieViewModel extends ChangeNotifier {
  BoxOfficeResponse? _movies;

  BoxOfficeResponse? get movies => _movies;

  Future<void> fetchPosts(String targetDt, String itemPerPage) async {
    try {
      BoxOfficeResponse fetchedPosts =
          await MovieService.getDailyBoxOfficeList(targetDt, itemPerPage);
      _movies = fetchedPosts;
      notifyListeners();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }
}
