import 'package:isar/isar.dart';

part 'plot.g.dart';


@Collection()
class Plot {
  Id? id;

  @Index(unique: true)
  late int pk = 0;
  
  double? totalHectares;
  double? cultivated;
  double? fallowHectares;

  Plot({this.totalHectares, this.cultivated, this.fallowHectares});

  factory Plot.fromJson(Map<String, dynamic> json) {
    return Plot(
      totalHectares: (json['total_hectares'] as num).toDouble(),
      cultivated: json['cultivated'],
      fallowHectares: (json['fallow_hectares'] as num).toDouble(),
    );
  }
}
