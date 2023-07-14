import 'package:flutter/material.dart';

import '../../viewmodel/MovieViewModel.dart';
import '../Screen/MyMovieScreenWidget.dart';

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
            Icon(icon,color: Colors.red),
            const SizedBox(
              width: 10,
            ),
            Text(title,style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
