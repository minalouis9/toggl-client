class Tags {
  String name;
  int id, wID;

  Tags({this.name, this.id, this.wID});

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(name: json["name"], id: json["id"], wID: json["wid"]);
  }
}
