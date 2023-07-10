import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../data/datasource/local/BoxOfficeAdapter.dart';
import '../../di/module.dart';
import '../viewmodel/MovieViewModel.dart';
import 'Screen/MovieScreenWidget.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final movieViewModelProvider = ChangeNotifierProvider((ref) => MovieViewModel());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(MovieAdapter());
  setupLocator();
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
