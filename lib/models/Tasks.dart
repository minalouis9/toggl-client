class Tasks {
  String name;
  int id, wID, pID, estimatedSeconds;
  bool active;

  Tasks(
      {this.name,
      this.id,
      this.wID,
      this.pID,
      this.estimatedSeconds,
      this.active});

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return Tasks(
        name: json["name"],
        id: json["id"],
        wID: json["wid"],
        pID: json["pid"],
        estimatedSeconds: json["estimated_seconds"],
        active: json["active"]);
  }
}
