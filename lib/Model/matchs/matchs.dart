class Matchs {
  String? teamAName;
  String? teamAImg;
  String? teamAResult;
  String? teamBName;
  String? teamBImg;
  String? teamBResult;
  String? status;
  String? stadium;
  String? chanel;
  String? time;
  String? link;

  Matchs(
      {this.teamAName,
      this.teamAImg,
      this.teamAResult,
      this.teamBName,
      this.teamBImg,
      this.teamBResult,
      this.status,
      this.stadium,
      this.chanel,
      this.time,
      this.link});

  Matchs.fromJson(Map<String, dynamic> json) {
    teamAName = json['teamA_name'];
    teamAImg = json['teamA_img'];
    teamAResult = json['teamA_result'];
    teamBName = json['teamB_name'];
    teamBImg = json['teamB_img'];
    teamBResult = json['teamB_result'];
    status = json['status'];
    stadium = json['stadium'];
    chanel = json['chanel'];
    time = json['time'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamA_name'] = this.teamAName;
    data['teamA_img'] = this.teamAImg;
    data['teamA_result'] = this.teamAResult;
    data['teamB_name'] = this.teamBName;
    data['teamB_img'] = this.teamBImg;
    data['teamB_result'] = this.teamBResult;
    data['status'] = this.status;
    data['stadium'] = this.stadium;
    data['chanel'] = this.chanel;
    data['time'] = this.time;
    data['link'] = this.link;
    return data;
  }
}
