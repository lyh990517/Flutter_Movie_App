import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';

import '../../data/model/BoxOfficeResponse.dart';

class GetMovieListUseCase {
  final MovieRepository _repository = GetIt.instance<MovieRepository>();

  Future<BoxOfficeResponse> invoke(String targetDt, String itemPerPage) {
    return _repository.getDailyBoxOfficeList(targetDt, itemPerPage);
  }
}
