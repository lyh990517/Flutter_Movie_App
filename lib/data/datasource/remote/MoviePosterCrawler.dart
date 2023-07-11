import 'dart:convert';
import 'dart:io';

class MoviePosterCrawler {
  Future<String> crawl(String code) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.themoviedb.org/search?query=$code"));
    HttpClientResponse response = await request.close();
    final text = await response.transform(utf8.decoder).join();
    httpClient.close();
    RegExp regExp = RegExp(r'<img loading="lazy" class="poster" src="([^"]+)"');
    Match? match = regExp.firstMatch(text);
    if (match != null) {
      String? imageUrl = match.group(1);
      String processedImageUrl = 'https://www.themoviedb.org$imageUrl';
      return processedImageUrl;
    }else{
      return "";
    }
  }

}