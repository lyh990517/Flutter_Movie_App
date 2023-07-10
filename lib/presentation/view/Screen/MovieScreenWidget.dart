import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/view/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../viewmodel/MovieViewModel.dart';
import '../ui_component/MovieItem.dart';
import '../ui_component/SearchBarWidget.dart';
import 'MyMovieScreenWidget.dart';

class MovieScreen extends HookConsumerWidget {
  const MovieScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
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
            viewModel: viewModel,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("검색 일자: ${formatDate()}"),
          ),
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(
                    movie: viewModel.movies?.boxOfficeResult.dailyBoxOfficeList[index],
                    onSave: (movie) {
                      viewModel.saveMovie(movie);
                      viewModel.loadMovies();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.viewModel,
  });

  final String title;
  final IconData icon;
  final MovieViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyMovieScreenWidget()));
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
