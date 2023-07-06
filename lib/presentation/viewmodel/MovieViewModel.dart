import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListUseCase.dart';
import 'package:get_it/get_it.dart';
import '../../data/model/BoxOfficeResponse.dart';

class MovieViewModel extends ChangeNotifier {
  BoxOfficeResponse? _movies;

  BoxOfficeResponse? get movies => _movies;

  GetMovieListUseCase getMovieListUseCase = GetIt.instance<GetMovieListUseCase>();

  Future<void> fetchPosts(String targetDt, String itemPerPage) async {
    try {
      BoxOfficeResponse fetchedPosts =
          await getMovieListUseCase.get(targetDt, itemPerPage);
      _movies = fetchedPosts;
      notifyListeners();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }
}
