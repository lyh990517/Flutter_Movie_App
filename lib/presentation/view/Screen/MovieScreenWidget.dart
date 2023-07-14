import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../di/module.dart';
import '../ui_component/DrawerItem.dart';
import '../ui_component/MovieListContainerWidget.dart';
import '../ui_component/SearchBarWidget.dart';

class MovieScreen extends HookConsumerWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    TextEditingController textEditingController = TextEditingController();

    void getMovies() {
      DateTime today = DateTime.now();
      DateTime yesterday = today.subtract(Duration(days: 1));
      String yesterdayDate = DateFormat('yyyyMMdd').format(yesterday);
      viewModel.getMovieList(yesterdayDate, "10");
    }

    useEffect(() {
      getMovies();
      return null;
    }, []);

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
            children: [
              DrawerItem(
                title: "My Movies",
                icon: Icons.favorite,
                viewModel: viewModel,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieListContainerWidget(
                  movieList: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList,
                  itemCount: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList.length ?? 0,
                  title: "금주의 최신 영화",
                  selectMovie: (index) => viewModel.selectMovie(index)),
              MovieListContainerWidget(
                  movieList: viewModel.myMovie,
                  itemCount: viewModel.myMovie?.length ?? 0,
                  title: "내가 찜한 영화",
                  selectMovie: (index) => viewModel.selectMovie(index)),
            ],
          ),
        ),
      ),
    );
  }
}
