import 'package:match/Model/matchs/leagues.dart';

class MatchsModel {
  Leagues? leagues;

  MatchsModel({this.leagues});

  MatchsModel.fromJson(Map<String, dynamic> json) {
    leagues =
        json['leagues'] != null ? new Leagues.fromJson(json['leagues']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['leagues'] = this.leagues!.toJson();
    }
    return data;
  }
}
