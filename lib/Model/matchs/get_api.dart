import 'package:dio/dio.dart';
import 'package:match/Model/matchs/Matchs_Model.dart';

class GetApi {
  Future<List<MatchsModel>?> getMatchs() async {
    try {
      var res = await Dio().get('http://ex.alnefely.tk/api/match');
      List<MatchsModel> data = [];
      for (var item in res.data) {
        data.add(MatchsModel.fromJson(item));
      }
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<List<MatchsModel>?> tomorrowMatchs() async {
    try {
      var res = await Dio().get('http://ex.alnefely.tk/api/tomorrow');
      List<MatchsModel> data = [];
      for (var item in res.data) {
        data.add(MatchsModel.fromJson(item));
      }
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<List<MatchsModel>?> yesterDayMatchs() async {
    try {
      var res = await Dio().get('http://ex.alnefely.tk/api/yesterday');
      List<MatchsModel> data = [];
      for (var item in res.data) {
        data.add(MatchsModel.fromJson(item));
      }
      return data;
    } catch (e) {
      return null;
    }
  }
}
