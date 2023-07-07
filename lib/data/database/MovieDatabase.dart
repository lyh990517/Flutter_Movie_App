import 'package:hive/hive.dart';

import '../model/BoxOffice.dart';

class MovieDatabase {
  late Box<BoxOffice> _database;

  MovieDatabase() {
    initialize();
  }

  void initialize() async {
    _database = await Hive.openBox<BoxOffice>('MyMovies');
  }

  void saveMovie(BoxOffice movie) async {
    final movies = _database.values.toList();
    final isDuplicate = movies.any((m) => m.movieCd == movie.movieCd);

    if (!isDuplicate) {
      _database.add(movie);
    } else {
      print('이미 저장된 영화입니다.');
    }
  }

  Future<List<BoxOffice>> loadMovies() async {
    final movies = _database.values.toList();
    return movies;
  }

  void deleteMovie(BoxOffice movie) {
    _database.delete(movie.key);
  }
}
