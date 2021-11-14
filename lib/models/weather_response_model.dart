class WeatherResponseModel {
  Location? location;
  Current? current;

  WeatherResponseModel({this.location, this.current});

  WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
}

class Current {
  String? lastUpdatedEpoch;
  String? lastUpdated;
  String? tempC;
  String? tempF;
  String? isDay;
  Condition? condition;
  String? windMph;
  String? windKph;
  String? windDegree;
  String? windDir;
  String? pressureMb;
  String? pressureIn;
  String? precipMm;
  String? precipIn;
  String? humidity;
  String? cloud;
  String? feelslikeC;
  String? feelslikeF;
  String? visKm;
  String? visMiles;
  String? uv;
  String? gustMph;
  String? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'].toString();
    lastUpdated = json['last_updated'].toString();
    tempC = json['temp_c'].toString();
    tempF = json['temp_f'].toString();
    isDay = json['is_day'].toString();
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'].toString();
    windKph = json['wind_kph'].toString();
    windDegree = json['wind_degree'].toString();
    windDir = json['wind_dir'].toString();
    pressureMb = json['pressure_mb'].toString();
    pressureIn = json['pressure_in'].toString();
    precipMm = json['precip_mm'].toString();
    precipIn = json['precip_in'].toString();
    humidity = json['humidity'].toString();
    cloud = json['cloud'].toString();
    feelslikeC = json['feelslike_c'].toString();
    feelslikeF = json['feelslike_f'].toString();
    visKm = json['vis_km'].toString();
    visMiles = json['vis_miles'].toString();
    uv = json['uv'].toString();
    gustMph = json['gust_mph'].toString();
    gustKph = json['gust_kph'].toString();
  }

}

class Condition {
  String? text;
  String? icon;
  String? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'].toString();
    icon = json['icon'].toString();
    code = json['code'].toString();
  }
}
