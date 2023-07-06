import 'package:flutter_mvvm/data/network/MovieDataSource.dart';
import 'package:flutter_mvvm/data/repository/MovieRepositoryImpl.dart';
import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListUseCase.dart';
import 'package:flutter_mvvm/presentation/viewmodel/MovieViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //Data
  locator.registerLazySingleton<MovieDataSource>(() => MovieDataSource());
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());

  //Domain
  locator.registerLazySingleton<GetMovieListUseCase>(() => GetMovieListUseCase());

  //Presentation
  locator.registerLazySingleton<MovieViewModel>(() => MovieViewModel());
}
