import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListUseCase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../../data/model/BoxOffice.dart';
import '../../data/model/BoxOfficeResponse.dart';

class MovieViewModel extends ChangeNotifier {
  BoxOfficeResponse? _movies;

  BoxOfficeResponse? get movies => _movies;

  GetMovieListUseCase getMovieListUseCase =
      GetIt.instance<GetMovieListUseCase>();

  late List<BoxOffice> _myMovie;

  List<BoxOffice> get myMovie => _myMovie;

  Future<void> getMovieList(String targetDt, String itemPerPage) async {
    try {
      BoxOfficeResponse fetchedPosts =
          await getMovieListUseCase.get(targetDt, itemPerPage);
      _movies = fetchedPosts;
      notifyListeners();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }

  void saveMovie(BoxOffice? movie) async {
    if (movie == null) return;

    final box = Hive.isBoxOpen('MyMovies')
        ? Hive.box<BoxOffice>('MyMovies')
        : await Hive.openBox<BoxOffice>('MyMovies');

    final movies = box.values.toList();
    final isDuplicate = movies.any((m) => m.movieCd == movie.movieCd);

    if (!isDuplicate) {
      box.add(movie);
    } else {
      print('이미 저장된 영화입니다.');
    }
  }

  Future<List<BoxOffice>> loadMovies() async {
    final box = Hive.isBoxOpen('MyMovies')
        ? Hive.box<BoxOffice>('MyMovies')
        : await Hive.openBox<BoxOffice>('MyMovies');

    final movies = box.values.toList();
    _myMovie = movies;
    notifyListeners();
    for (var movie in movies) {
      print(movie.movieNm);
    }

    return movies;
  }

  void deleteMovie(int index) async {
    final box = Hive.isBoxOpen('MyMovies')
        ? Hive.box<BoxOffice>('MyMovies')
        : await Hive.openBox<BoxOffice>('MyMovies');
    BoxOffice movie = _myMovie[index];
    box.delete(movie.key);

    await loadMovies();
  }
}
