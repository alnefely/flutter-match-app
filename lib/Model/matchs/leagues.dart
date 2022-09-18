import 'package:match/Model/matchs/matchs.dart';

class Leagues {
  String? name;
  List<Matchs>? matchs;

  Leagues({this.name, this.matchs});

  Leagues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['matchs'] != null) {
      matchs = <Matchs>[];
      json['matchs'].forEach((v) {
        matchs!.add(new Matchs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.matchs != null) {
      data['matchs'] = this.matchs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
