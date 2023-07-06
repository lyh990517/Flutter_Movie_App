
import '../../data/model/BoxOfficeResponse.dart';

abstract class MovieRepository {
  Future<BoxOfficeResponse> getDailyBoxOfficeList(String targetDt, String itemPerPage);
}