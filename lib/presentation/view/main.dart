import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../data/datasource/local/BoxOfficeAdapter.dart';
import 'Screen/MovieScreenWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(MovieAdapter());
  runApp(const ProviderScope(child: MyApp()));
  await Hive.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MovieScreen(),
      theme: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
    );
  }
}
