import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:flutter_mvvm/presentation/view/Screen/MovieDetailScreenWidget.dart';
import 'package:flutter_mvvm/presentation/view/Screen/MovieSearchScreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../di/module.dart';
import '../../../utils/ImageUtil.dart';
import '../../../utils/MoviePosterCrawler.dart';
import '../../viewmodel/MovieViewModel.dart';
import '../ui_component/DrawerItem.dart';
import '../ui_component/MovieListContainerWidget.dart';
import 'MovieInfolWidget.dart';

class MovieScreen extends HookConsumerWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    final moviesFuture = useMemoized(() => viewModel.getRecentMovie());
    final crawler = ref.watch(moviePosterCrawlerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.red),
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MovieSearchScreen()),
              );
            }, icon: const Icon(Icons.search))
          ],
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: const [
              DrawerItem(
                title: "My Movies",
                icon: Icons.favorite,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildRecentMoviesSection(viewModel, moviesFuture, crawler),
              MovieListContainerWidget(
                movieList: viewModel.myMovie,
                itemCount: viewModel.myMovie?.length ?? 0,
                title: "내가 찜한 영화",
                selectMovie: (index) => viewModel.selectMyMovie(index),
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MovieDetailScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentMoviesSection(
    MovieViewModel viewModel,
    Future<List<BoxOffice>?> moviesFuture,
    MoviePosterCrawler crawler,
  ) {
    return FutureBuilder<List<BoxOffice>?>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final movies = snapshot.data ?? [];
          return Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                posterImage(crawler, movies[0], double.infinity, 1),
                Column(
                  children: [
                    Text(snapshot.data?[0].movieNm ?? "",
                        style: const TextStyle(color: Colors.white, fontSize: 40),textAlign: TextAlign.center),
                    const SizedBox(height: 120)
                  ],
                )
              ]),
              const SizedBox(height: 20),
              MovieListContainerWidget(
                movieList: movies,
                itemCount: movies.length,
                title: "금주의 최신 영화",
                selectMovie: (index) => viewModel.selectMovie(index),
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MovieInfoScreen()),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
