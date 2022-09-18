class TeamA {
  String? img;
  String? name;
  String? coach;
  String? result;
  List<String>? golas;
  String? order;

  TeamA({this.img, this.name, this.coach, this.result, this.golas, this.order});

  TeamA.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    coach = json['coach'];
    result = json['result'];
    golas = json['golas'].cast<String>();
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['name'] = this.name;
    data['coach'] = this.coach;
    data['result'] = this.result;
    data['golas'] = this.golas;
    data['order'] = this.order;
    return data;
  }
}
