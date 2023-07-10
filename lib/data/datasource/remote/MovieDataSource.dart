import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/BoxOfficeResponse.dart';

class MovieDataSource {
  static const String baseUrl = "https://kobis.or.kr";

  Future<BoxOfficeResponse> getDailyBoxOfficeList(String targetDt, String itemPerPage) async {
    const apiKey = "df5a8f9d935c2beadde64a98bea56b11";
    print('$baseUrl/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$apiKey&targetDt=$targetDt&itemPerPage=$itemPerPage');
    final url = Uri.parse('$baseUrl/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$apiKey&targetDt=$targetDt&itemPerPage=$itemPerPage');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('성공');
      final jsonData = json.decode(response.body);
      final boxOfficeResponse = BoxOfficeResponse.fromJson(jsonData);
      return boxOfficeResponse;
    } else {
      throw Exception('Failed to load daily box office list');
    }
  }
}