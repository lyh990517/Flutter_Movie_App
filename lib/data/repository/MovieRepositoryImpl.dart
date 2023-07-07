import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';

import '../model/BoxOfficeResponse.dart';
import '../network/MovieDataSource.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieDataSource _myService = GetIt.instance<MovieDataSource>();

  @override
  Future<BoxOfficeResponse> getDailyBoxOfficeList(
      String targetDt, String itemPerPage) async {
    BoxOfficeResponse? result =
        await _myService.getDailyBoxOfficeList(targetDt, itemPerPage);
    return result;
  }
}
