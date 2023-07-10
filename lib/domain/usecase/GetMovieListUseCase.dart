import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';

import '../../data/model/BoxOfficeResponse.dart';

class GetMovieListUseCase {
  final MovieRepository _repository;

  GetMovieListUseCase(this._repository);

  Future<BoxOfficeResponse> invoke(String targetDt, String itemPerPage) {
    return _repository.getDailyBoxOfficeList(targetDt, itemPerPage);
  }
}
