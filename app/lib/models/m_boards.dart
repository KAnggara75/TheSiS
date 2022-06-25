class Board {
  int? id;
  String? name;
  List<Gyro>? gyro;
  List<Control>? control;
  List<Location>? location;

  Board({
    this.id,
    this.name,
    this.control,
    this.gyro,
    this.location,
  });

  Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['control'] != null) {
      control = <Control>[];
      json['control'].forEach((v) {
        control!.add(Control.fromJson(v));
      });
    }
    if (json['gyro'] != null) {
      gyro = <Gyro>[];
      json['gyro'].forEach((v) {
        gyro!.add(Gyro.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = <Location>[];
      json['location'].forEach((v) {
        location!.add(Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (control != null) {
      data['control'] = control!.map((v) => v.toJson()).toList();
    }
    if (gyro != null) {
      data['gyro'] = gyro!.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      data['location'] = location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Control {
  int? alarm;
  int? mesin;
  int? listrik;
  int? notif;

  Control({
    this.alarm,
    this.mesin,
    this.listrik,
    this.notif,
  });

  Control.fromJson(Map<String, dynamic> json) {
    alarm = json['alarm'];
    mesin = json['mesin'];
    listrik = json['listrik'];
    notif = json['notif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alarm'] = alarm;
    data['mesin'] = mesin;
    data['listrik'] = listrik;
    data['notif'] = notif;
    return data;
  }
}

class Gyro {
  int? id;
  int? x;
  int? y;
  int? z;

  Gyro({this.id, this.x, this.y, this.z});

  Gyro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x = json['x'];
    y = json['y'];
    z = json['z'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['x'] = x;
    data['y'] = y;
    data['z'] = z;
    return data;
  }
}

class Location {
  int? id;
  double? lat;
  double? lon;
  String? updatedAt;

  Location({
    this.id,
    this.lat,
    this.lon,
    this.updatedAt,
  });

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lon = json['lon'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lat'] = lat;
    data['lon'] = lon;
    data['updated_at'] = updatedAt;
    return data;
  }
}
