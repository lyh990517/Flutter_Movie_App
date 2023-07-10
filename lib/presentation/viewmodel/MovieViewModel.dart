import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/domain/usecase/DeleteOneMovieUseCase.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListFromDatabaseUseCase.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListUseCase.dart';

import '../../data/model/BoxOffice.dart';
import '../../data/model/BoxOfficeResponse.dart';
import '../../domain/usecase/SaveOneMovieUseCase.dart';

class MovieViewModel extends ChangeNotifier {
  final SaveOneMovieUseCase _saveOneMovieUseCase;
  final DeleteOneMovieUseCase _deleteOneMovieUseCase;
  final GetMovieListFromDatabaseUseCase _getMovieListFromDatabaseUseCase;
  final GetMovieListUseCase _getMovieListUseCase;
  MovieViewModel(this._deleteOneMovieUseCase, this._saveOneMovieUseCase, this._getMovieListFromDatabaseUseCase, this._getMovieListUseCase);

  BoxOfficeResponse? _movies;
  BoxOfficeResponse? get movies => _movies;

  late List<BoxOffice> _myMovie;
  List<BoxOffice> get myMovie => _myMovie;

  Future<void> getMovieList(String targetDt, String itemPerPage) async {
    try {
      BoxOfficeResponse fetchedPosts =
          await _getMovieListUseCase.invoke(targetDt, itemPerPage);
      _movies = fetchedPosts;
      notifyListeners();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }

  void saveMovie(BoxOffice? movie) async {
    if (movie == null) return;
    _saveOneMovieUseCase.invoke(movie);
  }

  Future<List<BoxOffice>> loadMovies() async {
    var movies = await _getMovieListFromDatabaseUseCase.invoke();
    _myMovie = movies;
    notifyListeners();
    return movies;
  }

  void deleteMovie(int index) async {
    _deleteOneMovieUseCase.invoke(myMovie[index]);
    await loadMovies();
  }
}
