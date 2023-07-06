import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../viewmodel/MovieViewModel.dart';
import 'MovieItem.dart';
import 'MyMovieScreenWidget.dart';
import 'SearchBarWidget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    String formatDate() {
      if (textEditingController.text.isNotEmpty) {
        DateTime date = DateTime.parse(textEditingController.text);
        final formatter = DateFormat('yyyy년 MM월 dd일');
        return formatter.format(date);
      } else {
        return "";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerItem(
              title: "My Movies",
              icon: Icons.favorite,
            )
          ],
        ),
      ),
      body: Consumer<MovieViewModel>(
        builder: (context, movieViewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                  textEditingController: textEditingController,
                  viewModel: movieViewModel),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("검색 일자: ${formatDate()}"),
              ),
              Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: movieViewModel
                        .movies?.boxOfficeResult.dailyBoxOfficeList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MovieItem(
                          movie: movieViewModel.movies?.boxOfficeResult
                              .dailyBoxOfficeList[index],
                        ),
                      );
                    },
                  ))
            ],
          );
        },
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyMovieScreenWidget()));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}