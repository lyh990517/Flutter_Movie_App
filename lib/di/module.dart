
import 'package:flutter_mvvm/data/network/MovieService.dart';
import 'package:flutter_mvvm/presentation/viewmodel/MovieViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<MovieService>(() => MovieService());
  locator.registerLazySingleton<MovieViewModel>(() => MovieViewModel());
}