import 'package:flutter_mvvm/data/model/BoxOffice.dart';
import 'package:hive/hive.dart';

class MovieAdapter extends TypeAdapter<BoxOffice> {
  @override
  int get typeId => 1;

  @override
  BoxOffice read(BinaryReader reader) {
    return BoxOffice(
      rnum: reader.readString(),
      rank: reader.readString(),
      rankInten: reader.readString(),
      rankOldAndNew: reader.readString(),
      movieCd: reader.readString(),
      movieNm: reader.readString(),
      openDt: reader.readString(),
      salesAmt: reader.readString(),
      salesShare: reader.readString(),
      salesInten: reader.readString(),
      salesChange: reader.readString(),
      salesAcc: reader.readString(),
      audiCnt: reader.readString(),
      audiInten: reader.readString(),
      audiChange: reader.readString(),
      audiAcc: reader.readString(),
      scrnCnt: reader.readString(),
      showCnt: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, BoxOffice obj) {
    writer.writeString(obj.rnum);
    writer.writeString(obj.rank);
    writer.writeString(obj.rankInten);
    writer.writeString(obj.rankOldAndNew);
    writer.writeString(obj.movieCd);
    writer.writeString(obj.movieNm);
    writer.writeString(obj.openDt);
    writer.writeString(obj.salesAmt);
    writer.writeString(obj.salesShare);
    writer.writeString(obj.salesInten);
    writer.writeString(obj.salesChange);
    writer.writeString(obj.salesAcc);
    writer.writeString(obj.audiCnt);
    writer.writeString(obj.audiInten);
    writer.writeString(obj.audiChange);
    writer.writeString(obj.audiAcc);
    writer.writeString(obj.scrnCnt);
    writer.writeString(obj.showCnt);
  }
}
