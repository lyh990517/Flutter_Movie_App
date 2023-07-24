import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/module.dart';
import 'package:flutter_mvvm/utils/ImageUtil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailScreen extends HookConsumerWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieViewModelProvider);
    final crawler = ref.watch(moviePosterCrawlerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.red),
            backgroundColor: Colors.black,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              posterImage(crawler, viewModel.selectedMovie, double.infinity, 1),
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '영화 제목: ${viewModel.selectedMovie!.movieNm}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '순위: ${viewModel.selectedMovie!.rank}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '순위 변동: ${viewModel.selectedMovie!.rankInten}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '신규 진입 여부: ${viewModel.selectedMovie!.rankOldAndNew}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '영화 코드: ${viewModel.selectedMovie!.movieCd}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '개봉일: ${viewModel.selectedMovie!.openDt}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '매출액: ${viewModel.selectedMovie!.salesAmt}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '매출 점유율: ${viewModel.selectedMovie!.salesShare}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '매출 변동: ${viewModel.selectedMovie!.salesInten}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '매출 변동율: ${viewModel.selectedMovie!.salesChange}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '누적 매출액: ${viewModel.selectedMovie!.salesAcc}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '관객 수: ${viewModel.selectedMovie!.audiCnt}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '관객 변동: ${viewModel.selectedMovie!.audiInten}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '관객 변동율: ${viewModel.selectedMovie!.audiChange}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '누적 관객 수: ${viewModel.selectedMovie!.audiAcc}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '상영 스크린 수: ${viewModel.selectedMovie!.scrnCnt}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '상영 횟수: ${viewModel.selectedMovie!.showCnt}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
