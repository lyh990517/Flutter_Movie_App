class BoxOffice {
  final String rnum;
  final String rank;
  final String rankInten;
  final String rankOldAndNew;
  final String movieCd;
  final String movieNm;
  final String openDt;
  final String salesAmt;
  final String salesShare;
  final String salesInten;
  final String salesChange;
  final String salesAcc;
  final String audiCnt;
  final String audiInten;
  final String audiChange;
  final String audiAcc;
  final String scrnCnt;
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