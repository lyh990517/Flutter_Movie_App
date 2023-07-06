import 'package:flutter/material.dart';

class MyMovieScreenWidget extends StatelessWidget {
  const MyMovieScreenWidget({super.key});


  @override
  Widget build(BuildContext context) {
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
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("2"),
          );
        },
      ),
    );
  }
}