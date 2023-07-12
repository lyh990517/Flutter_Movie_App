import 'package:flutter_mvvm/utils/MoviePosterCrawler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/datasource/local/MovieDatabase.dart';
import '../data/datasource/remote/MovieDataSource.dart';
import '../data/repository/DatabaseRepositoryImpl.dart';
import '../data/repository/MovieRepositoryImpl.dart';
import '../domain/repository/DatabaseRepository.dart';
import '../domain/repository/MovieRepository.dart';
import '../domain/usecase/DeleteOneMovieUseCase.dart';
import '../domain/usecase/GetMovieListFromDatabaseUseCase.dart';
import '../domain/usecase/GetMovieListUseCase.dart';
import '../domain/usecase/SaveOneMovieUseCase.dart';
import '../presentation/viewmodel/MovieViewModel.dart';


//Data
final movieDatabaseProvider = Provider((ref) => MovieDatabase());

final movieDataSourceProvider = Provider((ref) => MovieDataSource());

final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) {
  final movieDatabase = ref.watch(movieDatabaseProvider);
  return DatabaseRepositoryImpl(movieDatabase);
});

final moviePosterCrawlerProvider = Provider((ref) => MoviePosterCrawler());


final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final movieDataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(movieDataSource);
});

//Domain
final deleteOneMovieUseCaseProvider = Provider<DeleteOneMovieUseCase>((ref) {
  final databaseRepository = ref.watch(databaseRepositoryProvider);
  return DeleteOneMovieUseCase(databaseRepository);
});

final getMovieListFromDatabaseUseCaseProvider = Provider<GetMovieListFromDatabaseUseCase>((ref) {
  final databaseRepository = ref.watch(databaseRepositoryProvider);
  return GetMovieListFromDatabaseUseCase(databaseRepository);
});

final getMovieListUseCaseProvider = Provider<GetMovieListUseCase>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return GetMovieListUseCase(movieRepository);
});

final saveOneMovieUseCaseProvider = Provider<SaveOneMovieUseCase>((ref) {
  final databaseRepository = ref.watch(databaseRepositoryProvider);
  return SaveOneMovieUseCase(databaseRepository);
});

//Presentation
final movieViewModelProvider = ChangeNotifierProvider((ref) {
  var deleteOneMovieUseCase = ref.watch(deleteOneMovieUseCaseProvider);
  var getMovieListFromDatabaseUseCase = ref.watch(getMovieListFromDatabaseUseCaseProvider);
  var getMovieListUseCase = ref.watch(getMovieListUseCaseProvider);
  var saveOneMovieUseCase = ref.watch(saveOneMovieUseCaseProvider);
  return MovieViewModel(deleteOneMovieUseCase,saveOneMovieUseCase,getMovieListFromDatabaseUseCase,getMovieListUseCase);
});
