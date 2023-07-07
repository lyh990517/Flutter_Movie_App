import 'package:get_it/get_it.dart';

import '../../data/model/BoxOffice.dart';
import '../repository/DatabaseRepository.dart';

class DeleteOneMovieUseCase {
  final DatabaseRepository _repository = GetIt.instance<DatabaseRepository>();

  void invoke(BoxOffice movie) {
    _repository.deleteMovie(movie);
  }
}
