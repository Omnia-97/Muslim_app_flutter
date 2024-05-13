class RadioResponse {
  RadioResponse({
    this.radios,
  });

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radios.fromJson(v));
      });
    }
  }
  List<Radios>? radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Radios {
  Radios({
    this.id,
    this.name,
    this.url,
    this.recentDate,
  });

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }
}
