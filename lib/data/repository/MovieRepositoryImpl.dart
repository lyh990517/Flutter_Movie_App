import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';

import '../model/BoxOfficeResponse.dart';
import '../network/MovieDataSource.dart';

class MovieRepositoryImpl implements MovieRepository{
  MovieDataSource myService = GetIt.instance<MovieDataSource>();

  @override
  Future<BoxOfficeResponse> getDailyBoxOfficeList(
      String targetDt, String itemPerPage) async {
    BoxOfficeResponse? result =
        await myService.getDailyBoxOfficeList(targetDt, itemPerPage);
    return result;
  }
}
