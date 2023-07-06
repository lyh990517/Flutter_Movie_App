import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:hive/hive.dart';

class DatabaseViewModel {
  void saveMovie(BoxOffice movie) async {
    final box = await Hive.openBox('MyMovies');
    box.put('MyMovies', movie);
    final value = box.get('MyMovies');
    print('Value: $value');
  }
}
