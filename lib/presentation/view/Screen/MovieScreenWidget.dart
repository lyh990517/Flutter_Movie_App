import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../di/module.dart';
import '../ui_component/DrawerItem.dart';
import '../ui_component/MovieItem.dart';
import '../ui_component/MyMovieItem.dart';
import '../ui_component/SearchBarWidget.dart';

class MovieScreen extends HookConsumerWidget {
  const MovieScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    TextEditingController textEditingController = TextEditingController();

    void getMovies(){
      DateTime today = DateTime.now();
      DateTime yesterday = today.subtract(Duration(days: 1));
      String yesterdayDate = DateFormat('yyyyMMdd').format(yesterday);
      viewModel.getMovieList(yesterdayDate, "10");
    }

    useEffect(() {
      getMovies();
      return null;
    },[]);

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              textEditingController: textEditingController,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                    onClick: (){ viewModel.selectMovie(index); },
                    index: index,
                  );
                },
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.myMovie.length,
                itemBuilder: (context, index) {
                  return MyMovieItem(
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}