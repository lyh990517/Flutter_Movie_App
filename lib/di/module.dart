import 'package:flutter_mvvm/data/datasource/remote/MovieDataSource.dart';
import 'package:flutter_mvvm/data/repository/DatabaseRepositoryImpl.dart';
import 'package:flutter_mvvm/data/repository/MovieRepositoryImpl.dart';
import 'package:flutter_mvvm/domain/repository/DatabaseRepository.dart';
import 'package:flutter_mvvm/domain/repository/MovieRepository.dart';
import 'package:flutter_mvvm/domain/usecase/DeleteOneMovieUseCase.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListFromDatabaseUseCase.dart';
import 'package:flutter_mvvm/domain/usecase/GetMovieListUseCase.dart';
import 'package:flutter_mvvm/domain/usecase/SaveOneMovieUseCase.dart';
import 'package:flutter_mvvm/presentation/viewmodel/MovieViewModel.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/local/MovieDatabase.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //Data
  locator.registerLazySingleton<MovieDataSource>(() => MovieDataSource());
  locator.registerLazySingleton<MovieDatabase>(() => MovieDatabase());
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  locator.registerLazySingleton<DatabaseRepository>(() => DatabaseRepositoryImpl());
  //Domain
  locator.registerLazySingleton<GetMovieListUseCase>(() => GetMovieListUseCase());
  locator.registerLazySingleton<GetMovieListFromDatabaseUseCase>(() => GetMovieListFromDatabaseUseCase());
  locator.registerLazySingleton<SaveOneMovieUseCase>(() => SaveOneMovieUseCase());
  locator.registerLazySingleton<DeleteOneMovieUseCase>(() => DeleteOneMovieUseCase());

  //Presentation
  locator.registerLazySingleton<MovieViewModel>(() => MovieViewModel());
}
