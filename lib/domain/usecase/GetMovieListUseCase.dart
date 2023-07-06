import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';

import '../../data/model/BoxOfficeResponse.dart';

class GetMovieListUseCase {
  MovieRepository repository = GetIt.instance<MovieRepository>();

  Future<BoxOfficeResponse> get(String targetDt, String itemPerPage) {
    return repository.getDailyBoxOfficeList(targetDt, itemPerPage);
  }
}
