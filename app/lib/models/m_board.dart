import 'dart:convert';

Board boardFromJson(String str) => Board.fromJson(json.decode(str));

String boardToJson(Board data) => json.encode(data.toJson());

class Board {
  Board({
    required this.id,
    required this.name,
    required this.control,
    required this.gyro,
    required this.location,
  });

  int id;
  String name;
  List<Control> control;
  List<Gyro> gyro;
  List<Location> location;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["id"],
        name: json["name"],
        control:
            List<Control>.from(json["control"].map((x) => Control.fromJson(x))),
        gyro: List<Gyro>.from(json["gyro"].map((x) => Gyro.fromJson(x))),
        location: List<Location>.from(
            json["location"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "control": List<dynamic>.from(control.map((x) => x.toJson())),
        "gyro": List<dynamic>.from(gyro.map((x) => x.toJson())),
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}

class Control {
  Control({
    required this.alarm,
    required this.mesin,
    required this.listrik,
    required this.notif,
  });

  int alarm;
  int mesin;
  int listrik;
  int notif;

  factory Control.fromJson(Map<String, dynamic> json) => Control(
        alarm: json["alarm"],
        mesin: json["mesin"],
        listrik: json["listrik"],
        notif: json["notif"],
      );

  Map<String, dynamic> toJson() => {
        "alarm": alarm,
        "mesin": mesin,
        "listrik": listrik,
        "notif": notif,
      };
}

class Gyro {
  Gyro({
    required this.id,
    required this.x,
    required this.y,
    required this.z,
  });

  int id;
  int x;
  int y;
  int z;

  factory Gyro.fromJson(Map<String, dynamic> json) => Gyro(
        id: json["id"],
        x: json["x"],
        y: json["y"],
        z: json["z"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "x": x,
        "y": y,
        "z": z,
      };
}

class Location {
  Location({
    required this.id,
    required this.lat,
    required this.lon,
    required this.updatedAt,
  });

  int id;
  double lat;
  double lon;
  DateTime updatedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lon": lon,
        "updated_at": updatedAt.toIso8601String(),
      };
}
