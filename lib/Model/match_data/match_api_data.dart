import 'package:dio/dio.dart';
import 'package:match/Model/match_data/MatchData.dart';

class ApiMatchData {
  Future<List<MatchData>?> getMatchData(link) async {
    try {
      var res =
          await Dio().get('http://ex.alnefely.tk/api/overview?data=${link}');
      List<MatchData> data = [];

      data.add(MatchData.fromJson(res.data));
      return data;
    } catch (e) {
      return null;
    }
  }
}
