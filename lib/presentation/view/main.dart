import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../di/module.dart';
import '../viewmodel/MovieViewModel.dart';
import 'MovieScreenWidget.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GetIt.instance<MovieViewModel>(),
      child: MaterialApp(
        home: const MovieScreen(),
        theme: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      ),
    );
  }
}
