import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class BoxOffice extends HiveObject {
  @HiveField(0)
  final String rnum;
  @HiveField(1)
  final String rank;
  @HiveField(2)
  final String rankInten;
  @HiveField(3)
  final String rankOldAndNew;
  @HiveField(4)
  final String movieCd;
  @HiveField(5)
  final String movieNm;
  @HiveField(6)
  final String openDt;
  @HiveField(7)
  final String salesAmt;
  @HiveField(8)
  final String salesShare;
  @HiveField(9)
  final String salesInten;
  @HiveField(10)
  final String salesChange;
  @HiveField(11)
  final String salesAcc;
  @HiveField(12)
  final String audiCnt;
  @HiveField(13)
  final String audiInten;
  @HiveField(14)
  final String audiChange;
  @HiveField(15)
  final String audiAcc;
  @HiveField(16)
  final String scrnCnt;
  @HiveField(17)
  final String showCnt;

  BoxOffice({
    required this.rnum,
    required this.rank,
    required this.rankInten,
    required this.rankOldAndNew,
    required this.movieCd,
    required this.movieNm,
    required this.openDt,
    required this.salesAmt,
    required this.salesShare,
    required this.salesInten,
    required this.salesChange,
    required this.salesAcc,
    required this.audiCnt,
    required this.audiInten,
    required this.audiChange,
    required this.audiAcc,
    required this.scrnCnt,
    required this.showCnt,
  });

  factory BoxOffice.fromJson(Map<String, dynamic> json) {
    return BoxOffice(
      rnum: json['rnum'],
      rank: json['rank'],
      rankInten: json['rankInten'],
      rankOldAndNew: json['rankOldAndNew'],
      movieCd: json['movieCd'],
      movieNm: json['movieNm'],
      openDt: json['openDt'],
      salesAmt: json['salesAmt'],
      salesShare: json['salesShare'],
      salesInten: json['salesInten'],
      salesChange: json['salesChange'],
      salesAcc: json['salesAcc'],
      audiCnt: json['audiCnt'],
      audiInten: json['audiInten'],
      audiChange: json['audiChange'],
      audiAcc: json['audiAcc'],
      scrnCnt: json['scrnCnt'],
      showCnt: json['showCnt'],
    );
  }
}
