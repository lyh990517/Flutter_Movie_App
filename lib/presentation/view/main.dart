import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/database/BoxOfficeAdapter.dart';
import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../di/module.dart';
import '../viewmodel/MovieViewModel.dart';
import 'MovieScreenWidget.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(MovieAdapter());
  setupLocator();
  runApp(const MyApp());
  await Hive.close();
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
