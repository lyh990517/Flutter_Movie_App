import 'BoxOfficeResult.dart';

class BoxOfficeResponse {
  final BoxOfficeResult boxOfficeResult;

  BoxOfficeResponse({required this.boxOfficeResult});

  factory BoxOfficeResponse.fromJson(Map<String, dynamic> json) {
    return BoxOfficeResponse(
      boxOfficeResult: BoxOfficeResult.fromJson(json['boxOfficeResult']),
    );
  }
}