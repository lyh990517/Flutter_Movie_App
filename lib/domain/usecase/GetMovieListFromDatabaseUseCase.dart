import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:get_it/get_it.dart';

import '../repository/DatabaseRepository.dart';

class GetMovieListFromDatabaseUseCase {
  final DatabaseRepository _repository = GetIt.instance<DatabaseRepository>();

  Future<List<BoxOffice>> invoke() {
    return _repository.loadMovies();
  }
}
