class TimeEntry{
  int id, uID, wID, pID, duration;
  String guID, description;
  List<String> tags;
  bool billable, durOnly;
  DateTime start, end, at;

  TimeEntry(
      {this.id,
        this.uID,
        this.wID,
        this.pID,
        this.duration,
        this.guID,
        this.description,
        this.tags,
        this.billable,
        this.durOnly,
        this.start,
        this.end,
        this.at});

  factory TimeEntry.fromJson(Map<String, dynamic> json){
    List<dynamic> list = json["projects"];
    List<String> tagsList;
    if (list != null)
      tagsList = list;
    else
      tagsList = List();

    return TimeEntry(
      id: json["id"],
      uID: json["uid"],
      guID: json["guid"],
      wID: json["wid"],
      pID: json["pid"],
      duration: json["duration"],
      description: json["description"],
      tags: tagsList,
      billable: json["billable"],
      durOnly: json["duronly"],
      start: json["start"] == null ? null : DateTime.parse(json["start"]),
      end: json["stop"] == null ? null : DateTime.parse(json["stop"]),
      at: json["at"] == null ? null : DateTime.parse(json["at"]),
    );
  }
}