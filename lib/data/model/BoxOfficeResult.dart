import 'BoxOffice.dart';

class BoxOfficeResult {
  final String boxOfficeType;
  final String showRange;
  final List<BoxOffice> dailyBoxOfficeList;

  BoxOfficeResult({
    required this.boxOfficeType,
    required this.showRange,
    required this.dailyBoxOfficeList,
  });

  factory BoxOfficeResult.fromJson(Map<String, dynamic> json) {
    List<dynamic> boxOfficeList = json['dailyBoxOfficeList'];
    List<BoxOffice> parsedBoxOfficeList =
    boxOfficeList.map((e) => BoxOffice.fromJson(e)).toList();

    return BoxOfficeResult(
      boxOfficeType: json['boxofficeType'],
      showRange: json['showRange'],
      dailyBoxOfficeList: parsedBoxOfficeList,
    );
  }
}