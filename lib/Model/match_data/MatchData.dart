import 'package:match/Model/match_data/TeamA.dart';
import 'package:match/Model/match_data/TeamB.dart';

class MatchData {
  String? league;
  String? status;
  String? time;
  TeamA? teamA;
  TeamB? teamB;

  MatchData({this.league, this.status, this.time, this.teamA, this.teamB});

  MatchData.fromJson(Map<String, dynamic> json) {
    league = json['league'];
    status = json['status'];
    time = json['time'];
    teamA = json['teamA'] != null ? new TeamA.fromJson(json['teamA']) : null;
    teamB = json['teamB'] != null ? new TeamB.fromJson(json['teamB']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['league'] = this.league;
    data['status'] = this.status;
    data['time'] = this.time;
    if (this.teamA != null) {
      data['teamA'] = this.teamA!.toJson();
    }
    if (this.teamB != null) {
      data['teamB'] = this.teamB!.toJson();
    }
    return data;
  }
}
