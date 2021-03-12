class Workspaces {
  String name, defaultCurrency;
  int id;
  bool premium, admin;

  Workspaces(
      {this.name, this.defaultCurrency, this.id, this.premium, this.admin});

  factory Workspaces.fromJson(Map<String, dynamic> json) {
    return Workspaces(
        name: json["name"],
        id: json["id"],
        defaultCurrency: json["default_currency"],
        premium: json["premium"],
        admin: json["admin"]);
  }
}
