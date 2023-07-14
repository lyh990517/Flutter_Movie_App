import 'package:flutter/cupertino.dart';

import '../../../data/model/BoxOffice.dart';
import 'MovieItem.dart';

class MovieListContainerWidget extends StatelessWidget {
  const MovieListContainerWidget(
      {super.key,
        required this.movieList,
        required this.itemCount,
        required this.title,
        required this.selectMovie});

  final List<BoxOffice>? movieList;
  final int itemCount;
  final String title;
  final Function(int) selectMovie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontSize: 25)),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return MovieItem(
                movie: movieList?[index],
                onClick: () {
                  selectMovie(index);
                },
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
