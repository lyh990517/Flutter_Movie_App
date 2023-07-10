import '../../data/model/BoxOffice.dart';
import '../repository/DatabaseRepository.dart';

class DeleteOneMovieUseCase {
  final DatabaseRepository _repository;

  DeleteOneMovieUseCase(this._repository);

  void invoke(BoxOffice movie) {
    _repository.deleteMovie(movie);
  }
}
