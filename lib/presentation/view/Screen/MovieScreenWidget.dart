import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../di/module.dart';
import '../ui_component/DrawerItem.dart';
import '../ui_component/MovieListContainerWidget.dart';

class MovieScreen extends HookConsumerWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    final moviesFuture = useMemoized(() => viewModel.getRecentMovie());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.red),
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
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
              FutureBuilder<void>(
                future: moviesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return MovieListContainerWidget(
                      movieList: snapshot.data as List<BoxOffice>,
                      itemCount: (snapshot.data as List<BoxOffice>).length,
                      title: "금주의 최신 영화",
                      selectMovie: (index) => viewModel.selectMovie(index),
                      onClick: () {print("1");},
                    );
                  }
                },
              ),
              MovieListContainerWidget(
                movieList: viewModel.myMovie,
                itemCount: viewModel.myMovie?.length ?? 0,
                title: "내가 찜한 영화",
                selectMovie: (index) => viewModel.selectMovie(index),
                onClick: () {print("2");},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
