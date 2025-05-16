import 'package:isar/isar.dart';

part 'dashboard_data.g.dart';

@Collection()
class DashboardData {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  final FarmerStats farmers;
  final CooperativeStats cooperatives;

  DashboardData({required this.farmers, required this.cooperatives});

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      farmers: FarmerStats.fromJson(json['farmers']),
      cooperatives: CooperativeStats.fromJson(json['cooperatives']),
    );
  }
}

@embedded
class FarmerStats {
  int? total = 0;
  int? lastMonth = 0;
  int? male = 0;
  int? female = 0;

  FarmerStats({this.total, this.lastMonth, this.male, this.female});

  factory FarmerStats.fromJson(Map<String, dynamic> json) {
    return FarmerStats(
      total: json['total'],
      lastMonth: json['last_month'],
      male: json['male'],
      female: json['female'],
    );
  }
}

@embedded
class CooperativeStats {
  int? total = 0;
  int? lastMonth = 0;
  int? verified = 0;
  int? blacklisted = 0;

  CooperativeStats({
    this.total,
    this.lastMonth,
    this.verified,
    this.blacklisted,
  });

  factory CooperativeStats.fromJson(Map<String, dynamic> json) {
    return CooperativeStats(
      total: json['total'],
      lastMonth: json['last_month'],
      verified: json['verified'],
      blacklisted: json['blacklisted'],
    );
  }
}
