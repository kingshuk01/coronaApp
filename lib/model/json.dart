class CoronaModel {
  Latest latest;
  List<Locations> locations;

  CoronaModel({this.latest, this.locations});

  CoronaModel.fromJson(Map<String, dynamic> json) {
    latest =
        json['latest'] != null ? new Latest.fromJson(json['latest']) : null;
    if (json['locations'] != null) {
      locations = new List<Locations>();
      json['locations'].forEach((v) {
        locations.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.latest != null) {
      data['latest'] = this.latest.toJson();
    }
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Latest {
  int confirmed;
  int deaths;
  int recovered;

  Latest({this.confirmed, this.deaths, this.recovered});

  Latest.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    return data;
  }
}

class Locations {
  int id;
  String country;
  String countryCode;
  int countryPopulation;
  String province;
  String lastUpdated;
  Coordinates coordinates;
  Latest latest;

  Locations(
      {this.id,
      this.country,
      this.countryCode,
      this.countryPopulation,
      this.province,
      this.lastUpdated,
      this.coordinates,
      this.latest});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    countryCode = json['country_code'];
    countryPopulation = json['country_population'];
    province = json['province'];
    lastUpdated = json['last_updated'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    latest =
        json['latest'] != null ? new Latest.fromJson(json['latest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['country_population'] = this.countryPopulation;
    data['province'] = this.province;
    data['last_updated'] = this.lastUpdated;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    if (this.latest != null) {
      data['latest'] = this.latest.toJson();
    }
    return data;
  }
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
