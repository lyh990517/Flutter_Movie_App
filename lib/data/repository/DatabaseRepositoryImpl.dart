import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/domain/repository/DatabaseRepository.dart';
import 'package:get_it/get_it.dart';

import '../datasource/local/MovieDatabase.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final MovieDatabase _database = GetIt.instance<MovieDatabase>();

  @override
  void deleteMovie(BoxOffice movie) {
    _database.deleteMovie(movie);
  }

  @override
  Future<List<BoxOffice>> loadMovies() async {
    var movies = await _database.loadMovies();
    return movies;
  }

  @override
  void saveMovie(BoxOffice movie) {
    _database.saveMovie(movie);
  }
}
