import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/domain/repository/DatabaseRepository.dart';


class SaveOneMovieUseCase {
  final DatabaseRepository _repository;

  SaveOneMovieUseCase(this._repository);

  void invoke(BoxOffice movie) {
    _repository.saveMovie(movie);
  }
}
