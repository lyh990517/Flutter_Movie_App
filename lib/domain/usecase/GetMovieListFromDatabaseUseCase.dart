import 'package:flutter_mvvm/data/model/BoxOffice.dart';

import '../repository/DatabaseRepository.dart';

class GetMovieListFromDatabaseUseCase {
  final DatabaseRepository _repository;

  GetMovieListFromDatabaseUseCase(this._repository);

  Future<List<BoxOffice>> invoke() {
    return _repository.loadMovies();
  }
}
