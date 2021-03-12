class Clients {
  String name;
  int id, wID;

  Clients({this.name, this.id, this.wID});

  factory Clients.fromJson(Map<String, dynamic> json) {
    return Clients(name: json["name"], id: json["id"], wID: json["wid"]);
  }
}
