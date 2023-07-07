import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/domain/repository/DatabaseRepository.dart';
import 'package:get_it/get_it.dart';

class SaveOneMovieUseCase {
  final DatabaseRepository _repository = GetIt.instance<DatabaseRepository>();

  void invoke(BoxOffice movie) {
    _repository.saveMovie(movie);
  }
}
