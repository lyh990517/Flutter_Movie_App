import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';

import '../datasource/remote/MovieDataSource.dart';
import '../model/BoxOfficeResponse.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieDataSource _myService;

  MovieRepositoryImpl(this._myService);

  @override
  Future<BoxOfficeResponse> getDailyBoxOfficeList(
      String targetDt, String itemPerPage) async {
    BoxOfficeResponse? result =
        await _myService.getDailyBoxOfficeList(targetDt, itemPerPage);
    return result;
  }
}
