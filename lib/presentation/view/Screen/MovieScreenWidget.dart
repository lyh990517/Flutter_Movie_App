import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../di/module.dart';
import '../ui_component/DrawerItem.dart';
import '../ui_component/MovieItem.dart';
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
        resizeToAvoidBottomInset: false,
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                textEditingController: textEditingController,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("금주의 최신영화",style: TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index],
                      onClick: (){ viewModel.selectMovie(index); },
                      index: index,
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("내가 찜한 영화",style: TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.myMovie?.length ?? 0,
                  itemBuilder: (context, index) {
                    return MovieItem(onClick: (){}, index: index, movie: viewModel.myMovie?[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}