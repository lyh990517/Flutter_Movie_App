import 'package:flutter/material.dart';

import '../../data/model/BoxOffice.dart';
import 'MovieDetailWidget.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final BoxOffice? movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movie)));
      },
      child: Container(
        color: Colors.greenAccent,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.movie),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie!.movieNm,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${movie!.rank} 위"),
                      const SizedBox(width: 10),
                      Text("개봉 일자: ${movie!.openDt}")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}