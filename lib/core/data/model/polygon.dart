class Polygon {
  List<List<List<double>>>? coordinates;

  Polygon({this.coordinates});

  factory Polygon.fromJson(Map<String, dynamic> json) {
    List<List<List<double>>>? coords;
    if (json['coordinates'] != null && json['coordinates'] is List) {
      try {
        coords =
            (json['coordinates'] as List<dynamic>).map((polygonRing) {
              return (polygonRing as List<dynamic>).map((pointArray) {
                return (pointArray as List<dynamic>).map((coordinate) {
                  return (coordinate as num).toDouble();
                }).toList();
              }).toList();
            }).toList();
      } catch (e) {
        coords = null;
      }
    }
    return Polygon(coordinates: coords);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    return data;
  }
}
