import '../../data/model/BoxOffice.dart';

abstract class DatabaseRepository {
  void saveMovie(BoxOffice movie);

  Future<List<BoxOffice>> loadMovies();

  void deleteMovie(BoxOffice movie);
}
