class Projects {
  String name;
  int id, wID, cID;
  bool billable, active, isPrivate;

  Projects(
      {this.name,
      this.id,
      this.wID,
      this.cID,
      this.billable,
      this.active,
      this.isPrivate});

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
        name: json["name"],
        id: json["id"],
        wID: json["wid"],
        cID: json["cid"],
        billable: json["billable"],
        active: json["active"],
        isPrivate: json["is_private"]);
  }
}
