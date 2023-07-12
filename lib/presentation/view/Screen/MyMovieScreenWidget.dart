import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../di/module.dart';
import '../ui_component/MyMovieItem.dart';

class MyMovieScreenWidget extends HookConsumerWidget {
  const MyMovieScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("My Movies"),
      ),
      body: ListView.builder(
        itemCount: viewModel.myMovie?.length ?? 0,
        itemBuilder: (context, index) {
          return MyMovieItem(
              index: index
          );
        },
      ),
    );
  }
}